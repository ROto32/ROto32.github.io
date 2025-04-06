const input = document.getElementById('inputText');
const bubble = document.getElementById('bubbleText');

input.addEventListener('input', () => {
    bubble.textContent = input.value || "Salut !";
});
