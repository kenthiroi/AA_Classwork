
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  let dogLinks = [];
  for (const [breed, link] of Object.entries(dogs)) {
    const aTag = document.createElement("a");
    aTag.textContent = breed;
    aTag.setAttribute("href", link);
    const liTag = document.createElement("li");
    liTag.setAttribute("class", "dog-link");
    liTag.appendChild(aTag);
    dogLinks.push(liTag);
  }
  return dogLinks;
}

function attachDogLinks() {
  const dogLinks = dogLinkCreator();
  const dropdown = document.getElementsByClassName("drop-down-dog-list")[0];
  dogLinks.forEach((link) => dropdown.appendChild(link));
}

function handleEnter() {
  const dogLinks = document.querySelectorAll(".dog-link");
  dogLinks.forEach(dogLink => {
    dogLink.classList.add("dropdown-open");
  });
}

function handleLeave() {
  const dogLinks = document.querySelectorAll(".dog-link");
  dogLinks.forEach(dogLink => {
    dogLink.classList.remove("dropdown-open");
  });
}

attachDogLinks();


const hoverText = document.querySelector(".drop-down-dog-nav");
hoverText.addEventListener("mouseenter", handleEnter);
hoverText.addEventListener("mouseleave", handleLeave);