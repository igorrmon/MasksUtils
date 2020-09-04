/**
 * Helpers Functions
 */
import moment from "moment";

/**
 * Function to convert hex to rgba
 */
export function hexToRgbA(hex, alpha) {
  var c;
  if (/^#([A-Fa-f0-9]{3}){1,2}$/.test(hex)) {
    c = hex.substring(1).split("");
    if (c.length === 3) {
      c = [c[0], c[0], c[1], c[1], c[2], c[2]];
    }
    c = "0x" + c.join("");
    return (
      "rgba(" +
      [(c >> 16) & 255, (c >> 8) & 255, c & 255].join(",") +
      "," +
      alpha +
      ")"
    );
  }
  throw new Error("Bad Hex");
}

/**
 * Text Truncate
 */
export function textTruncate(str, length, ending) {
  if (length == null) {
    length = 100;
  }
  if (ending == null) {
    ending = "...";
  }
  if (str.length > length) {
    return str.substring(0, length - ending.length) + ending;
  } else {
    return str;
  }
}

/**
 * Get Date
 */
export function getTheDate(timestamp, format) {
  let time = timestamp * 1000;
  let formatDate = format ? format : "MM-DD-YYYY";
  return moment(time).format(formatDate);
}

/**
 * Convert Date To Timestamp
 */
export function convertDateToTimeStamp(date, format) {
  let formatDate = format ? format : "YYYY-MM-DD";
  return moment(date, formatDate).unix();
}

/**
 * Function to return current app layout
 */
export function getAppLayout(url) {
  let location = url.pathname;
  let path = location.split("/");
  return path[1];
}

/**
 *
 *Vlida se o email esta em um formato válido
 */
export const IsEmail = (email) => {
  var x = email;
  var atpos = x.indexOf("@");
  var dotpos = x.lastIndexOf(".");
  if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
    return false;
  }
  return true;
};

/**
 *Encrypta Dados
 */
export function encrypta(str) {
  var hex = "";
  for (var i = 0; i < str.length; i++) {
    hex += "" + str.charCodeAt(i).toString(16);
  }
  console.log(typeof hex);
  return hex;
}
/**
 *Desencrypta Dados
 */
export function desencrypta(hex) {
  var hex = hex.toString(); //force conversion
  var str = "";
  for (var i = 0; i < hex.length; i += 2)
    str += String.fromCharCode(parseInt(hex.substr(i, 2), 16));
  return str;
}

//formatar data de DD/MM/YYYY PARA YYYY-MM-DDDD
export function convertData(str) {
  return str.split("/").reverse().join("-");
}

/**
 * Pegar hora atual formatada
 */
export const getTimeNow = () => {
  let data = new Date();
  var h = data.getHours();
  var m = data.getMinutes();
  var s = data.getSeconds();
  let data2 = new Date(data.valueOf() - data.getTimezoneOffset() * 60000);
  return data2.toISOString().replace(/\.\d{3}Z$/, "");
};

export const dataAtualFormatada = () => {
  var data = new Date(),
    dia = data.getDate().toString(),
    diaF = dia.length == 1 ? "0" + dia : dia,
    mes = (data.getMonth() + 1).toString(), //+1 pois no getMonth Janeiro começa com zero.
    mesF = mes.length == 1 ? "0" + mes : mes,
    anoF = data.getFullYear();
  return diaF + "/" + mesF + "/" + anoF;
};

/**
 * convert from 99999999999 to 999.999.999-99
 * OBS: converts as you type
 */
export const cpfMask = (value) => {
  return value
    .replace(/\D/g, "")
    .replace(/(\d{3})(\d)/, "$1.$2")
    .replace(/(\d{3})(\d)/, "$1.$2")
    .replace(/(\d{3})(\d{1,2})/, "$1-$2")
    .replace(/(-\d{2})\d+?$/, "$1");
};

/**
 * convert from 99999999999 to 999.999.999-99
 * OBS: only is converted when there are 11 digits in the input
 */
export const CpfMask = (value) => {
  return value
    .replace(/\D/g, "")
    .replace(/^([\d]{3})([\d]{3})([\d]{3})([\d]{2})$/, "$1.$2.$3-$4");
};

/**
 * convert from 99999999 to 99999-999
 * OBS: only is converted when there are 8 digits in the input
 */
export const cepMask = (value) => {
  return value.replace(/\D/g, "").replace(/(\d{5})(\d{3})/, "$1-$2");
};

/**
 * Convert from 99999999999 to (99)9 9999-9999
 */
export const PhoneMaskBR = (value) => {
  return value
    .replace(/\D/g, "")
    .replace(/(\d{2})(\d{5})(\d{4})/, "($1) $2-$3");
};
