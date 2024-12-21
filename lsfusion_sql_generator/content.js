function addSQLButton() {
    const activeLabels = document.querySelectorAll("div.nav-link.active label");
    
    activeLabels.forEach(label => {
        if (!label.querySelector('.sql-btn')) { // Avoid adding the button multiple times
            const originalText = label.innerText.trim().split('\n')[0]; // Capture and trim to the first line
            const button = document.createElement('button');
            button.textContent = "Получить SQL скрипт";
            button.className = "sql-btn"; // Add a class for styling or future reference
            button.style.marginLeft = "10px"; // Ensure button does not overlap with label
            button.addEventListener('click', (event) => {
                event.stopPropagation(); // Prevent the click from propagating to the label
                fetchAndDownloadSQL(originalText);
            });
            label.appendChild(button);
        }
    });
}

function fetchAndDownloadSQL(filename) {
    const repoOwner = 'Valeonl'; // Replace with your GitHub username
    const repoName = 'lsfusion_sql_query_extractor'; // Replace with your repository name
    const filenameMap = {
        'Справочник "Руководящие документы"': 'doc_ruk.sql',
        'Справочник "Учреждения"': 'directory.sql'
    };

    const mappedFilename = filenameMap[filename] || filename;
    const fileUrl = `https://raw.githubusercontent.com/${repoOwner}/${repoName}/main/${mappedFilename}`;
    alert(fileUrl);
    fetch(fileUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok.');
            }
            return response.text();
        })
        .then(content => {
            downloadFile(mappedFilename.replace(/\.sql$/, ''), content);
        })
        .catch(error => {
            console.error('Ошибка загрузки SQL-скрипта:', error);
            alert('Ошибка загрузки SQL-скрипта');
        });
}

function downloadFile(filename, content) {
    const blob = new Blob([content], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `${filename}.sql`; // Ensure the downloaded file has .sql extension
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
}

// Initial call to add the buttons when the content script is loaded
addSQLButton();

// Optionally, you might want to observe the DOM and re-add buttons if new elements are added dynamically
const observer = new MutationObserver(addSQLButton);
observer.observe(document.body, { childList: true, subtree: true });