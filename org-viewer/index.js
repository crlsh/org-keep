import { unified } from "unified";
import parse from "uniorg-parse";
import uniorg2rehype from "uniorg-rehype";
import stringify from "rehype-stringify";

window.parseOrgToHTML = async function(orgText) {
  try {
    const file = await unified()
      .use(parse)
      .use(uniorg2rehype)
      .use(stringify)
      .process(orgText);
    
    return String(file);
  } catch (error) {
    console.error('Error parseando Org:', error);
    throw error;
  }
};

window.orgParserReady = true;
console.log('Parser Org listo');
