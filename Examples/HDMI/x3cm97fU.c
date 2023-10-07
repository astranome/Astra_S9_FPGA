#include "stdint.h"
#include "stdbool.h"
#include "xv_tpg.h"
#include "sleep.h"

XV_tpg tpg;

int main()
{
	XV_tpg_Initialize(&tpg, XPAR_V_TPG_0_DEVICE_ID);

	XV_tpg_Set_width(&tpg, 1920);
	XV_tpg_Set_height(&tpg, 1080);

	XV_tpg_Set_ZplateHorContDelta(&tpg, 2);
	XV_tpg_Set_ZplateHorContStart(&tpg, 2);
	XV_tpg_Set_ZplateVerContDelta(&tpg, 2);
	XV_tpg_Set_ZplateVerContStart(&tpg, 2);

	XV_tpg_Set_motionSpeed(&tpg, 2);
	XV_tpg_Set_motionEn(&tpg, 1);

	XV_tpg_EnableAutoRestart(&tpg);
	XV_tpg_Start(&tpg);

	int pattern = 1;

	while(true)
	{
		XV_tpg_Set_bckgndId(&tpg, pattern);

		if(++pattern > 19)
		{
			pattern = 1;
		}

		usleep(5000000);
	}

	return 0;
}
