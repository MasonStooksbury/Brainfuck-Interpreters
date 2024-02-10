const fs = require('fs');
const path = require('path');

const ignoredDirectories = new Set(['in-progress', 'node_modules', '.git']);
const rootPath = '.'; // Root of the repository

// Function to scan directories and filter based on criteria
function scanDirectories(basePath) {
    return fs.readdirSync(basePath, { withFileTypes: true })
        .filter(dirent => dirent.isDirectory() && !ignoredDirectories.has(dirent.name))
        .map(dirent => dirent.name);
}

// Generate Mermaid chart code
function generateMermaidChart(directories) {
    let mermaidCode = 'graph LR\n';
    directories.forEach(dir => {
        mermaidCode += `    ${dir} --> ${dir}_content["${dir}"]\n`;
    });
    return mermaidCode;
}

const directories = scanDirectories(rootPath);
const mermaidChart = generateMermaidChart(directories);
console.log(mermaidChart);
