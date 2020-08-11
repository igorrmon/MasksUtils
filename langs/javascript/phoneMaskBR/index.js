function PhoneMaskBR(value) {
    return value.replace(/\D/g, '').replace(/(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
}


// Attention to limit the number of characters that will be typed use(minlength and maxlength) of the<inputs>