function checaCPF (CPF) {
	if (cpf.length !== 11 || ['00000000000', '11111111111', '22222222222',
          '33333333333', '44444444444', '55555555555', '66666666666',
          '77777777777', '88888888888', '99999999999'].includes(cpf)) {
            return false;
        }

	soma = 0;
	for(i = 0; i < 9; i ++) {
		soma += parseInt(CPF.charAt(i)) * (10 - i);
	}
	resto = 11 - (soma % 11);
	if(resto == 10 || resto == 11) {
		resto = 0;
	}
	if(resto != parseInt(CPF.charAt(9))) {
		return false;
	}
	soma = 0;
	for (i = 0; i < 10; i ++) {
		soma += parseInt(CPF.charAt(i)) * (11 - i);
	}
	resto = 11 - (soma % 11);
	if(resto == 10 || resto == 11) {
		resto = 0;
	}
	if(resto != parseInt(CPF.charAt(10))) {
		return false;
	}
	return true;
}
