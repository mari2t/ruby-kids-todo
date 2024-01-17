import "controllers";

window.mathChallenge = function () {
  const num1 = Math.floor(Math.random() * 9) + 1; // 1 から 9 まで
  const num2 = Math.floor(Math.random() * 9) + 1;

  // 掛け算の問題を生成
  const answer = num1 * num2;

  // ユーザーに問題を提示し、答えを求める
  const userAnswer = prompt(`${num1} × ${num2} = ?`);

  // 答えの検証
  if (parseInt(userAnswer) === answer) {
    return true;
  } else {
    alert("不正解です。");
    return false;
  }
};
