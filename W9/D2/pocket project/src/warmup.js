
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    // if (htmlElement.hasChildNodes()) {
    //     htmlElement.removeChild(htmlElement.firstChild);
    // }
    if (htmlElement.children) {
        Array.from(htmlElement.children).forEach((child) => htmlElement.removeChild(child));
      }
    const el = document.createElement('p');
    el.textContent = string;
    htmlElement.appendChild(el);
};
htmlGenerator('Party Time.', partyHeader);