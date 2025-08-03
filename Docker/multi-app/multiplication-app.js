const num1 = Math.ceil(Math.random()*10);

const num2 = Math.ceil(Math.random()*10);

const questionEl = document.getElementById("question");

const formEl = document.getElementById("form");

const inputEl=document.getElementById("input");

const scoreEl = document.getElementById("score");


let score = JSON.parse(localStorage.getItem("score"));

if(!score){
    score = 0;
}

scoreEl.innerText = `score: ${score}`;

questionEl.innerText = `what is ${num1} multiply by ${num2} ?`;

const correctAns = num1 * num2;

formEl.addEventListener("submit", () =>{
    const userInput = +inputEl.value;
/*    console.log(userInput, typeof userInput);*/
    if(userInput === correctAns){
        score++;
        updateLocalStorage()
        ///console.log(score);
    }
    else{
        score--;
        updateLocalStorage()   
        ///console.log(score);
    }    
})


function updateLocalStorage(){
    localStorage.setItem("score", JSON.stringify(score))
}

/*console.log(num1)*/


