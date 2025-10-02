# FindMore 🔍

A comprehensive subdomain enumeration tool that combines multiple reconnaissance tools to discover subdomains for a target domain.

## Features

- **Multi-tool Integration**: Combines results from 5 different subdomain enumeration tools
- **Duplicate Removal**: Automatically removes duplicate entries for clean results
- **Smart File Naming**: Generates unique output filenames to avoid overwriting existing files
- **Beautiful CLI**: Colorful output with styled logo and progress indicators
- **Clean Workflow**: Automatically cleans up temporary files after processing

## Tools Integrated

- **Subfinder**: Fast passive subdomain discovery
- **Assetfinder**: Find domains and subdomains related to a given domain
- **Chaos**: Actively maintained subdomain wordlist
- **Findomain**: Cross-platform subdomain enumerator
- **crt.sh**: Certificate transparency logs scraping

## Prerequisites

Before using FindMore, ensure you have the following tools installed:

```bash
# Install Subfinder
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install Assetfinder
go install github.com/tomnomnom/assetfinder@latest

# Install Chaos
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest

# Install Findomain
sudo apt install findomain

# Install Node.js for oh-my-logo (for the banner)
npm install -g oh-my-logo
```

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/findmore.git
cd findmore
```

2. Make the script executable:
```bash
chmod u+x findmore.sh
```

## Usage

```bash
./findmore.sh <target-domain>
```

### Example

```bash
./findmore.sh example.com
```

## Output

The tool will:
1. Display a stylized banner with the tool name
2. Run all enumeration tools in parallel
3. Combine and deduplicate results
4. Save the final list to `subdomains.txt` (or `subdomains-N.txt` if file exists)
5. Display summary statistics

### Sample Output
```
FindMore
A Comprehensive tool for collection subdomain!

✅ Subdomain Enumeration For example.com Is Done.
✅ Results saved in subdomains.txt
✅ Total subdomains found: 247
Version: 1.0.0
Author: Arion
```

## File Structure

```
├── findmore.sh          # Main enumeration script
└── README.md           # This file
```

## How It Works

1. **Input Validation**: Checks if a target domain is provided
2. **File Management**: Generates unique output filenames to prevent overwrites
3. **Parallel Enumeration**: Runs multiple tools simultaneously:
   - Subfinder for passive discovery
   - Assetfinder for comprehensive asset discovery
   - Chaos for wordlist-based enumeration
   - Findomain for cross-platform enumeration
   - crt.sh API for certificate transparency logs
4. **Result Processing**: Combines all results and removes duplicates
5. **Cleanup**: Removes temporary files and displays final statistics

## Configuration

### API Keys (Optional but Recommended)

For better results, configure API keys for the tools:

- **Subfinder**: Configure in `~/.config/subfinder/provider-config.yaml`
- **Chaos**: Set up ProjectDiscovery API key
- **Other tools**: Refer to their respective documentation

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.


## Disclaimer

This tool is intended for authorized penetration testing and bug bounty activities only. Users are responsible for ensuring they have proper authorization before scanning any domains. The authors are not responsible for any misuse of this tool.

## Author

**Arion**

## Version History

- **v1.0.0** - Initial release with multi-tool integration and clean output

## Support

If you encounter any issues or have suggestions for improvements, please open an issue on GitHub.

---

⭐ **Star this repository if you find it useful!**
