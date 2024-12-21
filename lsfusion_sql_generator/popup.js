document.getElementById("grabBtn").addEventListener("click", () => {
    chrome.tabs.query({ active: true, currentWindow: true }, function (tabs) {
        var tab = tabs[0];
        if (tab) {
            execScript(tab);
        } else {
            alert("Нет активных вкладок");
        }
    });
});

document.getElementById("copyBtn").addEventListener("click", () => {
    const sqlCode = document.getElementById("sqlCode").value;
    navigator.clipboard.writeText(sqlCode).then(() => {
        downloadFile('script.sql', sqlCode);
        alert("SQL-скрипт загружен");
    });
});

function downloadFile(filename, content) {
    const blob = new Blob([content], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
}

function execScript(tab) {
    chrome.scripting.executeScript(
        {
            target: { tabId: tab.id, allFrames: true },
            func: grabSQL
        },
        onResult
    );
}

function onResult(results) {
    if (!results || !results.length) {
        document.getElementById("sqlCode").value = "Не удалось найти SQL-скрипт";
        return;
    }
    
    const sqlScript = results[0].result;
    document.getElementById("sqlCode").value = sqlScript;
    
    loadSQLFile(sqlScript).then((scriptContent) => {
        document.getElementById("sqlCode").value = scriptContent || "SQL-скрипт не найден";
    }).catch(() => {
        document.getElementById("sqlCode").value = "Ошибка загрузки SQL-скрипта";
    });
}

function grabSQL() {
    const lsfusion_tabs = document.querySelectorAll("div.nav-link.active label");
    return Array.from(lsfusion_tabs).map(tab => tab.innerText.trim()).join(''); // Assuming you need the first tab
}

function loadSQLFile(filename) {
    const repoOwner = 'Valeonl'; // Replace with your GitHub username
    const repoName = 'lsfusion_sql_query_extractor'; // Replace with your repository name
    const filePath = `path/to/sql/files/${filename}`; // Replace with the path to your SQL files in the repo
    const testPath = `doc_ruk.sql`
    const fileUrl = `https://raw.githubusercontent.com/${repoOwner}/${repoName}/main/${testPath}`;

    return fetch(fileUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok.');
            }
            return response.text();
        });
}