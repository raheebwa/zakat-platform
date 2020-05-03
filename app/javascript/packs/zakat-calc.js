const getInputValue = (id) => {
    const MyEl = document.getElementById(id);
    return MyEl.value;
};

const setEl = (id, value) => {
    const MyEl = document.getElementById(id);
    MyEl.innerHTML = value;
};

const prevModal = document.getElementById("show-calc-review");
const calcForm = document.getElementById("zakat-calc");
const zakat_paid = document.getElementById("payment_zakat_paid");

const calcSubmit = (event) => {
    const cash = getInputValue("payment_cash") ?
        getInputValue("payment_cash") :
        0;
    const debit = getInputValue("payment_debit") ?
        getInputValue("payment_debit") :
        0;
    const credit = getInputValue("payment_credit") ?
        getInputValue("payment_credit") :
        0;
    const assets = getInputValue("payment_assets") ?
        getInputValue("payment_assets") :
        0;
    const current_nisab = getInputValue("payment_current_nisab");

    zakat_paid.value =
        (parseInt(cash) +
            parseInt(debit) +
            parseInt(assets) -
            (parseInt(current_nisab) + parseInt(credit))) *
        (2.5 / 100);
};

const prevSummary = (event) => {
    const cash = getInputValue("payment_cash") ?
        getInputValue("payment_cash") :
        0;
    const debit = getInputValue("payment_debit") ?
        getInputValue("payment_debit") :
        0;
    const credit = getInputValue("payment_credit") ?
        getInputValue("payment_credit") :
        0;
    const assets = getInputValue("payment_assets") ?
        getInputValue("payment_assets") :
        0;
    const current_nisab = getInputValue("payment_current_nisab");

    const totalDebit = parseInt(cash) + parseInt(debit) + parseInt(assets);
    const totalCredit = parseInt(credit);

    const afterNisab = totalDebit - totalCredit - parseInt(current_nisab);
    const zakatPaid = (afterNisab * 2.5) / 100;

    setEl("prev-cash", cash);
    setEl("prev-debit", debit);
    setEl("prev-credit", credit);
    setEl("prev-assets", assets);
    setEl("prev-nisab", current_nisab);
    setEl("prev-total-debit", totalDebit);
    setEl("prev-total-credit", totalCredit);
    setEl("prev-after-nisab", afterNisab);
    setEl("prev-zakat-paid", zakatPaid);

    if (zakatPaid < 1) {
        const zakatSubmit = document.getElementById("zakat_submit");
        zakatSubmit.innerHTML = "You can not pay";
        zakatSubmit.classList.add("d-none");

        document.getElementById("too-low-message").innerHTML =
            "Your Zakatable amount in below nisab you are not eligible to pay Zakat al-maal";
    }
};

prevModal.addEventListener("click", prevSummary);
calcForm.addEventListener("submit", calcSubmit);