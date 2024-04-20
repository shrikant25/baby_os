unsigned char port_byte_in(unsigned short port) {
	__asm__("in %%dx, %%al" : "=a" (result), "d" (port));
	return result;
}

unsigned char port_byte_out(unsigned short port) {
	__asm__("out %%al, %%dx" : "a" (result), "d" (port));
	return result;
}


unsigned char port_word_in(unsigned short port, unsigned char data) {
	__asm__("in %%dx, %%ax" : "a" (data), "d" (port));
	return result;
}



unsigned char port_byte_in(unsigned short porti, unsigned char data) {
	__asm__("out %%ax, %%dx" : "a" (data), "d" (port));
	return result;
}






