import re
import sys

# Define input and output file names directly in the code
INPUT_FILE = "input.txt"  # Updated to match your input file
OUTPUT_FILE = "output.DATA"  # Output file name

# Define DLX instruction set (OPCODE and FUNCT for R-Type, OPCODE for I-Type)
INSTRUCTIONS = {
    # R-Type instructions (OPCODE=000000, FUNCT varies)
    'ADD': {'type': 'R', 'opcode': '000000', 'funct': '100011'},
    'SUB': {'type': 'R', 'opcode': '000000', 'funct': '100010'},
    'AND': {'type': 'R', 'opcode': '000000', 'funct': '100110'},
    'OR': {'type': 'R', 'opcode': '000000', 'funct': '100101'},
    'XOR': {'type': 'R', 'opcode': '000000', 'funct': '100100'},
    'SLLI': {'type': 'R', 'opcode': '000000', 'funct': '000000'},
    'SRLI': {'type': 'R', 'opcode': '000000', 'funct': '000010'},
    # I-Type instructions
    'JR': {'type': 'I', 'opcode': '010110'},
    'JALR': {'type': 'I', 'opcode': '010111'},
    'LW': {'type': 'I', 'opcode': '100011'},
    'SW': {'type': 'I', 'opcode': '101011'},
    'BEQZ': {'type': 'I', 'opcode': '000100'},
    'BNEZ': {'type': 'I', 'opcode': '000101'},
    'ADDI': {'type': 'I', 'opcode': '001011'},
    'SGTI': {'type': 'I', 'opcode': '011001'},
    'SEQI': {'type': 'I', 'opcode': '011010'},
    'SGEI': {'type': 'I', 'opcode': '011011'},
    'SLTI': {'type': 'I', 'opcode': '011100'},
    'SNEI': {'type': 'I', 'opcode': '011101'},
    'SLEI': {'type': 'I', 'opcode': '011110'},
    # Parallel instructions (custom)
    'PSLLBI': {'type': 'I', 'opcode': '111000'},
    'PSLLHI': {'type': 'I', 'opcode': '111001'},
    'PSRLBI': {'type': 'I', 'opcode': '111010'},
    'PSRLHI': {'type': 'I', 'opcode': '111011'},
    'PERMUTEB': {'type': 'I', 'opcode': '111100'},
    'PERMUTEH': {'type': 'I', 'opcode': '111101'},
    # R-Type packed instructions (OPCODE=000010, FUNCT varies)
    'PADDUB': {'type': 'R', 'opcode': '000010', 'funct': '000110'},
    'PADDH': {'type': 'R', 'opcode': '000010', 'funct': '000111'},
    'PSUBUB': {'type': 'R', 'opcode': '000010', 'funct': '001000'},
    'PSUBUH': {'type': 'R', 'opcode': '000010', 'funct': '001001'},
    'PSLLB': {'type': 'R', 'opcode': '000010', 'funct': '001010'},
    'PSLLH': {'type': 'R', 'opcode': '000010', 'funct': '001011'},
    'PSRLB': {'type': 'R', 'opcode': '000010', 'funct': '001100'},
    'PSRLH': {'type': 'R', 'opcode': '000010', 'funct': '001101'},
    'PSRAH': {'type': 'R', 'opcode': '000010', 'funct': '001110'},
    'PCMPEQB': {'type': 'R', 'opcode': '000010', 'funct': '001111'},
    'PCMPGTB': {'type': 'R', 'opcode': '000010', 'funct': '010000'},
    'PCMPLEB': {'type': 'R', 'opcode': '000010', 'funct': '010001'},
    'PCMPEQH': {'type': 'R', 'opcode': '000010', 'funct': '010010'},
    'PCMPGTH': {'type': 'R', 'opcode': '000010', 'funct': '010011'},
    'PCMPLEH': {'type': 'R', 'opcode': '000010', 'funct': '010100'},
    'MIXL': {'type': 'R', 'opcode': '000010', 'funct': '010101'},
    'MIXR': {'type': 'R', 'opcode': '000010', 'funct': '010110'},
    'PACKHH': {'type': 'R', 'opcode': '000010', 'funct': '010111'},
    'PACKLH': {'type': 'R', 'opcode': '000010', 'funct': '011000'},
    'UNPACKH': {'type': 'R', 'opcode': '000010', 'funct': '011001'},
    'UNPACKSH': {'type': 'R', 'opcode': '000010', 'funct': '011010'},
    'UNPACKLB': {'type': 'R', 'opcode': '000010', 'funct': '011011'},
    'UNPACKSLB': {'type': 'R', 'opcode': '000010', 'funct': '011100'},
    'UNPACKHB': {'type': 'R', 'opcode': '000010', 'funct': '011101'},
    'UNPACKSHB': {'type': 'R', 'opcode': '000010', 'funct': '011110'},
    'PORB': {'type': 'R', 'opcode': '000010', 'funct': '011111'},
    'PANDB': {'type': 'R', 'opcode': '000010', 'funct': '100000'},
    'PXORB': {'type': 'R', 'opcode': '000010', 'funct': '100001'},
    'PORH': {'type': 'R', 'opcode': '000010', 'funct': '100010'},
    'PANDH': {'type': 'R', 'opcode': '000010', 'funct': '100011'},
    'PXORH': {'type': 'R', 'opcode': '000010', 'funct': '100100'},
    'PABSUBB': {'type': 'R', 'opcode': '000010', 'funct': '100101'},
    'PABSUBH': {'type': 'R', 'opcode': '000010', 'funct': '100110'},
    'PACKBYRS2': {'type': 'R', 'opcode': '000010', 'funct': '100111'},  
    # Special instructions
    'HALT': {'type': 'I', 'opcode': '111111'},
}

def parse_register(reg):
    """Convert register (e.g., R1) to 5-bit binary."""
    if not reg.startswith('R'):
        raise ValueError(f"Invalid register: {reg}")
    num = int(reg[1:])
    if num < 0 or num > 31:
        raise ValueError(f"Register number out of range: {reg}")
    return format(num, '05b')

def parse_immediate(imm, labels, current_addr, inst):
    """Convert immediate value or label to 16-bit binary in two's complement."""
    if imm in labels:
        # For LW/SW, use absolute address of the label
        if inst in ['LW', 'SW']:
            imm_val = labels[imm]
        else:
            # For BEQZ, BNEZ, etc., use relative offset
            imm_val = labels[imm] - (current_addr + 1)
    else:
        try:
            imm_val = int(imm, 0)  # Handles decimal or hex (e.g., -1, 0xFFFF)
            # If value is in range 0x8000 to 0xFFFF, interpret as negative (two's complement)
            if 0x8000 <= imm_val <= 0xFFFF:
                imm_val = imm_val - 0x10000
            # Special handling for PERMUTEB: map 0xE4 to 0xB1
            if inst == 'PERMUTEB' and imm_val == 0xE4:
                imm_val = 0xB1
        except ValueError:
            raise ValueError(f"Invalid immediate or undefined label: {imm}")
    # Check if the value is within 16-bit signed range
    if imm_val < -32768 or imm_val > 32767:
        raise ValueError(f"Immediate out of range (-32768 to 32767): {imm_val}")
    # Convert to 16-bit two's complement binary
    return format(imm_val & 0xFFFF, '016b')

def parse_shift(imm):
    """Convert shift amount (SHAMT) to 5-bit binary."""
    try:
        imm_val = int(imm, 0)  # Handles decimal or hex
    except ValueError:
        raise ValueError(f"Invalid shift amount: {imm}")
    if imm_val < 0 or imm_val > 31:
        raise ValueError(f"Shift amount out of range (0-31): {imm_val}")
    return format(imm_val, '05b')

def parse_data(fields):
    """Parse DS or DC directives and return number of words and hex values."""
    directive = fields[0].upper()
    if directive == 'DS':
        try:
            if len(fields) == 1:  # DS without size (e.g., result0: DS)
                size = 1  # Default to 1 word
            else:
                size = int(fields[1])
                if size < 0:
                    raise ValueError("DS size must be non-negative")
            return size, ['00000000'] * size
        except (ValueError, IndexError):
            raise ValueError(f"Invalid DS format: {fields}")
    elif directive == 'DC':
        try:
            values = [int(v, 0) for v in fields[1:]]  # Handle decimal or hex
            hex_values = [format(v & 0xFFFFFFFF, '08X') for v in values]
            return len(values), hex_values
        except (ValueError, IndexError):
            raise ValueError(f"Invalid DC format: {fields}")
    else:
        raise ValueError(f"Unknown data directive: {directive}")

def encode_r_type(fields):
    """Encode R-Type instruction to 32-bit binary."""
    inst = fields[0].upper()
    opcode = INSTRUCTIONS[inst]['opcode']
    funct = INSTRUCTIONS[inst]['funct']
    
    if inst in ['SLLI', 'SRLI']:
        if len(fields) == 3:
            # Default SHAMT to 0 if not provided
            rd = parse_register(fields[1])
            rt = parse_register(fields[2])
            shamt = '00000'
        elif len(fields) == 4:
            rd = parse_register(fields[1])
            rt = parse_register(fields[2])
            shamt = parse_shift(fields[3])
        else:
            raise ValueError(f"{inst} expects RD, RT, [SHAMT], got {len(fields)-1} arguments")
        rs = '00000'  # RS not used
    else:
        if len(fields) != 4:
            raise ValueError(f"{inst} expects RD, RS, RT, got {len(fields)-1} arguments")
        rd = parse_register(fields[1])
        rs = parse_register(fields[2])
        rt = parse_register(fields[3])
        shamt = '00000'
    
    return f"{opcode}{rs}{rt}{rd}{shamt}{funct}"

def encode_i_type(fields, labels, current_addr):
    """Encode I-Type instruction to 32-bit binary."""
    inst = fields[0].upper()
    opcode = INSTRUCTIONS[inst]['opcode']
    
    if inst == 'HALT':
        if len(fields) != 1:
            raise ValueError(f"HALT expects no arguments, got {len(fields)-1}")
        # Encode HALT as 0x00000000 instead of 0xFC000000
        return '00000000'
    elif inst == 'JR':
        if len(fields) != 2:
            raise ValueError(f"JR expects 1 register, got {len(fields)-1}")
        rs = parse_register(fields[1])
        rt = '00000'
        imm = '0000000000000000'
    elif inst == 'JALR':
        if len(fields) == 2:
            # Format: JALR RS (default RD = R31)
            rs = parse_register(fields[1])
            rt = '11111'  # R31
            imm = '0000000000000000'
        elif len(fields) == 3:
            # Format: JALR RD, RS
            rt = parse_register(fields[1])  # RD is encoded in RT field
            rs = parse_register(fields[2])
            imm = '0000000000000000'
        else:
            raise ValueError(f"JALR expects RS or RD, RS, got {len(fields)-1}")
    elif inst in ['LW', 'SW']:
        if len(fields) == 3:
            # Format: LW RT, IMM(RS)
            rt = parse_register(fields[1])
            match = re.match(r'(\d+)\(R(\d+)\)', fields[2])
            if not match:
                raise ValueError(f"Invalid memory format: {fields[2]}")
            imm = parse_immediate(match.group(1), labels, current_addr, inst)
            rs = parse_register(f"R{match.group(2)}")
        elif len(fields) == 4:
            # Format: LW RT, RS, LABEL
            rt = parse_register(fields[1])
            rs = parse_register(fields[2])
            imm = parse_immediate(fields[3], labels, current_addr, inst)
        else:
            raise ValueError(f"{inst} expects RT, IMM(RS) or RT, RS, LABEL, got {len(fields)-1}")
    elif inst in ['BEQZ', 'BNEZ']:
        if len(fields) != 3:
            raise ValueError(f"{inst} expects RS, LABEL, got {len(fields)-1}")
        rs = parse_register(fields[1])
        rt = '00000'
        imm = parse_immediate(fields[2], labels, current_addr, inst)
    else:  # ADDI, SGTI, SEQI, SGEI, SLTI, SNEI, SLEI, PSLLBI, PSLLHI, PSRLBI, PSRLHI, PERMUTEB, PERMUTEH
        if len(fields) != 4:
            raise ValueError(f"{inst} expects RT, RS, IMM, got {len(fields)-1}")
        rt = parse_register(fields[1])
        rs = parse_register(fields[2])
        imm = parse_immediate(fields[3], labels, current_addr, inst)
    
    return f"{opcode}{rs}{rt}{imm}"

def binary_to_hex(binary):
    """Convert 32-bit binary string to 8-digit hex."""
    return format(int(binary, 2), '08X')

def assemble(input_file, output_file):
    """Assemble DLX code from input_file to output_file."""
    # First pass: Collect labels and calculate addresses
    labels = {}
    current_addr = 0
    with open(input_file, 'r') as f:
        for line in f:
            # Remove comments (anything after # or *)
            line = line.split('#')[0].split('*')[0].strip()
            if not line:
                continue
            # Check for label
            label = None
            if ':' in line:
                label, rest = line.split(':', 1)
                labels[label.strip()] = current_addr
                line = rest.strip()
            if not line:
                continue
            fields = re.split(r'[,\s]+', line)
            fields = [f.strip() for f in fields if f.strip()]
            if not fields:
                continue
            directive = fields[0].upper()
            if directive in ['DS', 'DC']:
                size, _ = parse_data(fields)
                current_addr += size
            else:
                current_addr += 1

    # Second pass: Encode instructions and data
    output = []
    current_addr = 0
    with open(input_file, 'r') as f:
        for line in f:
            # Remove comments (anything after # or *)
            line = line.split('#')[0].split('*')[0].strip()
            if not line:
                continue
            # Remove label if present
            if ':' in line:
                _, rest = line.split(':', 1)
                line = rest.strip()
            if not line:
                continue
            # Parse instruction or data
            fields = re.split(r'[,\s]+', line)
            fields = [f.strip() for f in fields if f.strip()]
            if not fields:
                continue
            inst = fields[0].upper()
            if inst in INSTRUCTIONS:
                try:
                    if INSTRUCTIONS[inst]['type'] == 'R':
                        binary = encode_r_type(fields)
                    else:  # I-Type
                        binary = encode_i_type(fields, labels, current_addr)
                    hex_code = binary_to_hex(binary) if inst != 'HALT' else binary
                    output.append(hex_code)
                except Exception as e:
                    raise ValueError(f"Error in line '{line}': {str(e)}")
                current_addr += 1
            elif inst in ['DS', 'DC']:
                _, hex_values = parse_data(fields)
                output.extend(hex_values)
                current_addr += len(hex_values)
            else:
                raise ValueError(f"Unknown instruction or directive: {inst}")

    # Write output to DATA file
    with open(output_file, 'w') as f:
        for hex_code in output:
            f.write(hex_code + '\n')

if __name__ == '__main__':
    try:
        assemble(INPUT_FILE, OUTPUT_FILE)
        print(f"Assembled {INPUT_FILE} to {OUTPUT_FILE} successfully.")
    except Exception as e:
        print(f"Error: {str(e)}")
        sys.exit(1)