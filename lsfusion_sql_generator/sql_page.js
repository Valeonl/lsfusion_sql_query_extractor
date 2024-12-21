// sql_page.js
chrome.runtime.onMessage.addListener(function (message, sender, sendResponse) {
    if (message.tabsNames) {
        addImagesToContainer(message.tabsNames);
    }
    sendResponse("OK");
});

function addImagesToContainer(tabsNames) {
    const container = document.querySelector(".container");
    if (container) {
        const list = document.createElement("ul");
        tabsNames.forEach(name => {
            const listItem = document.createElement("li");
            listItem.textContent = name;
            list.appendChild(listItem);
        });
        container.appendChild(list);
    }
}
