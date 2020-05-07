/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_152(char*, char *);
extern void execute_153(char*, char *);
extern void execute_154(char*, char *);
extern void execute_155(char*, char *);
extern void execute_288(char*, char *);
extern void execute_289(char*, char *);
extern void execute_290(char*, char *);
extern void execute_291(char*, char *);
extern void execute_292(char*, char *);
extern void execute_293(char*, char *);
extern void execute_3(char*, char *);
extern void execute_5(char*, char *);
extern void execute_6(char*, char *);
extern void execute_151(char*, char *);
extern void execute_232(char*, char *);
extern void execute_233(char*, char *);
extern void execute_234(char*, char *);
extern void execute_235(char*, char *);
extern void execute_236(char*, char *);
extern void execute_237(char*, char *);
extern void execute_238(char*, char *);
extern void execute_239(char*, char *);
extern void execute_240(char*, char *);
extern void execute_241(char*, char *);
extern void execute_242(char*, char *);
extern void execute_243(char*, char *);
extern void execute_244(char*, char *);
extern void execute_245(char*, char *);
extern void execute_246(char*, char *);
extern void execute_247(char*, char *);
extern void execute_248(char*, char *);
extern void execute_249(char*, char *);
extern void execute_250(char*, char *);
extern void execute_251(char*, char *);
extern void execute_252(char*, char *);
extern void execute_253(char*, char *);
extern void execute_254(char*, char *);
extern void execute_255(char*, char *);
extern void execute_256(char*, char *);
extern void execute_257(char*, char *);
extern void execute_258(char*, char *);
extern void execute_259(char*, char *);
extern void execute_260(char*, char *);
extern void execute_261(char*, char *);
extern void execute_262(char*, char *);
extern void execute_263(char*, char *);
extern void execute_264(char*, char *);
extern void execute_265(char*, char *);
extern void execute_266(char*, char *);
extern void execute_267(char*, char *);
extern void execute_268(char*, char *);
extern void execute_269(char*, char *);
extern void execute_270(char*, char *);
extern void execute_271(char*, char *);
extern void execute_272(char*, char *);
extern void execute_273(char*, char *);
extern void execute_274(char*, char *);
extern void execute_275(char*, char *);
extern void execute_276(char*, char *);
extern void execute_277(char*, char *);
extern void execute_278(char*, char *);
extern void execute_279(char*, char *);
extern void execute_280(char*, char *);
extern void execute_281(char*, char *);
extern void execute_282(char*, char *);
extern void execute_283(char*, char *);
extern void execute_284(char*, char *);
extern void execute_285(char*, char *);
extern void execute_286(char*, char *);
extern void execute_287(char*, char *);
extern void execute_8(char*, char *);
extern void execute_9(char*, char *);
extern void execute_10(char*, char *);
extern void execute_160(char*, char *);
extern void execute_161(char*, char *);
extern void execute_72(char*, char *);
extern void execute_73(char*, char *);
extern void execute_74(char*, char *);
extern void execute_192(char*, char *);
extern void execute_193(char*, char *);
extern void execute_136(char*, char *);
extern void execute_137(char*, char *);
extern void execute_138(char*, char *);
extern void execute_224(char*, char *);
extern void execute_225(char*, char *);
extern void execute_157(char*, char *);
extern void execute_158(char*, char *);
extern void execute_159(char*, char *);
extern void execute_294(char*, char *);
extern void execute_295(char*, char *);
extern void execute_296(char*, char *);
extern void execute_297(char*, char *);
extern void execute_298(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void vlog_transfunc_eventcallback_2state(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_57(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_59(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_66(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_68(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_75(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_77(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_84(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_86(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_93(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_95(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_102(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_104(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_111(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_113(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_120(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_122(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_129(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_131(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_138(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_140(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_147(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_149(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_156(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_158(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_165(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_167(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_174(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_176(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_183(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_185(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_192(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_194(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_200(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_202(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_208(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_210(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_216(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_218(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_224(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_226(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_232(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_234(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_240(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_242(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_248(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_250(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_256(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_258(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_264(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_266(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_272(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_274(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_280(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_282(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_288(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_290(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_296(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_298(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_304(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_306(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_312(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_314(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_320(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_322(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_329(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_331(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_338(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_340(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_347(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_349(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_356(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_358(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[168] = {(funcp)execute_152, (funcp)execute_153, (funcp)execute_154, (funcp)execute_155, (funcp)execute_288, (funcp)execute_289, (funcp)execute_290, (funcp)execute_291, (funcp)execute_292, (funcp)execute_293, (funcp)execute_3, (funcp)execute_5, (funcp)execute_6, (funcp)execute_151, (funcp)execute_232, (funcp)execute_233, (funcp)execute_234, (funcp)execute_235, (funcp)execute_236, (funcp)execute_237, (funcp)execute_238, (funcp)execute_239, (funcp)execute_240, (funcp)execute_241, (funcp)execute_242, (funcp)execute_243, (funcp)execute_244, (funcp)execute_245, (funcp)execute_246, (funcp)execute_247, (funcp)execute_248, (funcp)execute_249, (funcp)execute_250, (funcp)execute_251, (funcp)execute_252, (funcp)execute_253, (funcp)execute_254, (funcp)execute_255, (funcp)execute_256, (funcp)execute_257, (funcp)execute_258, (funcp)execute_259, (funcp)execute_260, (funcp)execute_261, (funcp)execute_262, (funcp)execute_263, (funcp)execute_264, (funcp)execute_265, (funcp)execute_266, (funcp)execute_267, (funcp)execute_268, (funcp)execute_269, (funcp)execute_270, (funcp)execute_271, (funcp)execute_272, (funcp)execute_273, (funcp)execute_274, (funcp)execute_275, (funcp)execute_276, (funcp)execute_277, (funcp)execute_278, (funcp)execute_279, (funcp)execute_280, (funcp)execute_281, (funcp)execute_282, (funcp)execute_283, (funcp)execute_284, (funcp)execute_285, (funcp)execute_286, (funcp)execute_287, (funcp)execute_8, (funcp)execute_9, (funcp)execute_10, (funcp)execute_160, (funcp)execute_161, (funcp)execute_72, (funcp)execute_73, (funcp)execute_74, (funcp)execute_192, (funcp)execute_193, (funcp)execute_136, (funcp)execute_137, (funcp)execute_138, (funcp)execute_224, (funcp)execute_225, (funcp)execute_157, (funcp)execute_158, (funcp)execute_159, (funcp)execute_294, (funcp)execute_295, (funcp)execute_296, (funcp)execute_297, (funcp)execute_298, (funcp)vlog_transfunc_eventcallback, (funcp)vlog_transfunc_eventcallback_2state, (funcp)transaction_52, (funcp)transaction_57, (funcp)transaction_59, (funcp)transaction_66, (funcp)transaction_68, (funcp)transaction_75, (funcp)transaction_77, (funcp)transaction_84, (funcp)transaction_86, (funcp)transaction_93, (funcp)transaction_95, (funcp)transaction_102, (funcp)transaction_104, (funcp)transaction_111, (funcp)transaction_113, (funcp)transaction_120, (funcp)transaction_122, (funcp)transaction_129, (funcp)transaction_131, (funcp)transaction_138, (funcp)transaction_140, (funcp)transaction_147, (funcp)transaction_149, (funcp)transaction_156, (funcp)transaction_158, (funcp)transaction_165, (funcp)transaction_167, (funcp)transaction_174, (funcp)transaction_176, (funcp)transaction_183, (funcp)transaction_185, (funcp)transaction_192, (funcp)transaction_194, (funcp)transaction_200, (funcp)transaction_202, (funcp)transaction_208, (funcp)transaction_210, (funcp)transaction_216, (funcp)transaction_218, (funcp)transaction_224, (funcp)transaction_226, (funcp)transaction_232, (funcp)transaction_234, (funcp)transaction_240, (funcp)transaction_242, (funcp)transaction_248, (funcp)transaction_250, (funcp)transaction_256, (funcp)transaction_258, (funcp)transaction_264, (funcp)transaction_266, (funcp)transaction_272, (funcp)transaction_274, (funcp)transaction_280, (funcp)transaction_282, (funcp)transaction_288, (funcp)transaction_290, (funcp)transaction_296, (funcp)transaction_298, (funcp)transaction_304, (funcp)transaction_306, (funcp)transaction_312, (funcp)transaction_314, (funcp)transaction_320, (funcp)transaction_322, (funcp)transaction_329, (funcp)transaction_331, (funcp)transaction_338, (funcp)transaction_340, (funcp)transaction_347, (funcp)transaction_349, (funcp)transaction_356, (funcp)transaction_358};
const int NumRelocateId= 168;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/network_tb_behav/xsim.reloc",  (void **)funcTab, 168);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/network_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/network_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/network_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/network_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/network_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
