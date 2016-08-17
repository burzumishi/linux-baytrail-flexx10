#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xad06f5bd, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0xadcc345, __VMLINUX_SYMBOL_STR(i2c_del_driver) },
	{ 0xcc7a032c, __VMLINUX_SYMBOL_STR(i2c_register_driver) },
	{ 0x8bc6f111, __VMLINUX_SYMBOL_STR(iio_device_register) },
	{ 0xdcc0e00b, __VMLINUX_SYMBOL_STR(__mutex_init) },
	{ 0xe0a7695b, __VMLINUX_SYMBOL_STR(iio_device_alloc) },
	{ 0x52d664a5, __VMLINUX_SYMBOL_STR(i2c_smbus_read_byte) },
	{ 0xa58054c9, __VMLINUX_SYMBOL_STR(i2c_smbus_write_word_data) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0x144b9d46, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0x2d955749, __VMLINUX_SYMBOL_STR(i2c_smbus_read_word_data) },
	{ 0x8079d8c2, __VMLINUX_SYMBOL_STR(__dynamic_dev_dbg) },
	{ 0x4f459e90, __VMLINUX_SYMBOL_STR(iio_device_free) },
	{ 0xd9e5f3d7, __VMLINUX_SYMBOL_STR(iio_device_unregister) },
	{ 0xa0c6b103, __VMLINUX_SYMBOL_STR(mutex_unlock) },
	{ 0x3be4cbeb, __VMLINUX_SYMBOL_STR(mutex_lock) },
	{ 0xbdfb6dbb, __VMLINUX_SYMBOL_STR(__fentry__) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=industrialio";

MODULE_ALIAS("acpi*:CPLM3218:*");
MODULE_ALIAS("of:N*T*Cinvn,cm3218");
MODULE_ALIAS("of:N*T*Cinvn,cm3218C*");
MODULE_ALIAS("i2c:cm3218");
