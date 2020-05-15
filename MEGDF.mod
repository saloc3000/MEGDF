/*
 * Modelo de equilibrio general dinámico Fedesarrollo
 *

//***************************************************************
// Definición de variables endógenas
//***************************************************************
var
//Para cambios de endogeno en las variables de productividad ver pg. 58 del documento
    BC_t                ${BC_t}$                (long_name='Balanza comercial')
    B_gt                ${B_gt}$                (long_name='Oferta de bonos domésticos del gobierno')
    B_pt                ${B_pt}$                (long_name='Demanda de bonos del gobierno del sector privado')
//Revisar B_t_o y CC_t
    B_t_o               ${B_t_o}$               (long_name='Demanda de bonos domésticos de la familia Ricardiana')
    CC_t                ${CC_t}$                (long_name='Cuenta corriente*')
//Para CM_it se deben agregar más adelante dos variables donde se igualen con el precio, ver pg 27.
    CM_1t               ${CM_1t}$               (long_name='Costo marginal de minoristas del sector 1')
    CM_2t               ${CM_2t}$               (long_name='Costo marginal de minoristas del sector 2')
//C_pt debe empalmarse con la ecuación de la pg. 57
    C_pt                ${C_pt}$                (long_name='Gasto de consumo real del sector privado')
    C_t_NO              ${C_t_NO}$              (long_name='Gasto de consumo real de la familia no-Ricardiana')
    C_t_O               ${C_t_O}$               (long_name='Gasto de consumo real de la familia Ricardiana') 
    D_ct                ${D_ct}$                (long_name='Insumo de bien doméstico en producción del bien de consumo')
    D_it                ${D_it}$                (long_name='Insumo de bien doméstico en producción del bien de inversión')
    D_gt_as             ${D_gt_as}$             (long_name='Deuda externa del gobierno')
    D_pt_as             ${D_pt_as}$             (long_name='Deuda externa del sector privado')
//Revisar D_t_asO
    D_t_asO              ${D_t_asO}$            (long_name='Deuda externa de la familia Ricardiana')
    E_t                 ${E_t}$                 (long_name='Exportaciones reales totales')
    E_Ct                ${E_Ct}$                (long_name='Exportaciones reales del bien de consumo')
    E_t_oil             ${E_t_oil}$             (long_name='Exportaciones petroleras')
    F_t                 ${F_t}$                 (long_name='Necesidades nominales de financiación del gobierno')
    ghama_pibt          ${ghama_pibt}$          (long_name='Tasa bruta de crecimiento del PIB real')
    G_t                 ${G_t}$                 (long_name='Gasto corriente real del gobierno')
    g_Ct                ${g_Ct}$                (long_name='Gasto corriente del gobierno como % del PIB nominal')
    h_1t                ${h_1t}$                (long_name='Oferta total de trabajo en sector 1')
    h_2t                ${h_2t}$                (long_name='Oferta total de trabajo en sector 2')
    h_3t                ${h_3t}$                (long_name='Oferta total de trabajo en sector 3')
    h_1t_NO             ${h_1t_NO}$             (long_name='Oferta de trabajo de la familia no Ricardiana en sector 1')
    h_2t_NO             ${h_2t_NO}$             (long_name='Oferta de trabajo de la familia no Ricardiana en sector 2')
    h_3t_NO             ${h_3t_NO}$             (long_name='Oferta de trabajo de la familia no Ricardiana en sector 3')
    h_1t_O              ${h_1t_O}$              (long_name='Oferta de trabajo de la familia Ricardiana en sector 1')
    h_2t_O              ${h_2t_O}$              (long_name='Oferta de trabajo de la familia Ricardiana en sector 2')
    h_3t_O              ${h_3t_O}$              (long_name='Oferta de trabajo de la familia Ricardiana en sector 3')
//Para II_gt II_mt revisar pg. 41
    II_gt               ${II_gt}$               (long_name='Función Indicador para cambio de régimen de gasto público')
    II_mt               ${II_mt}$               (long_name='Función Indicador para cambio de régimen de política monetaria')
    I_gt                ${I_gt}$                (long_name='Inversión real de gobierno en infraestructura')
    I_1t                ${I_1t}$                (long_name='Inversión privada en capital del sector 1')
    I_2t                ${I_2t}$                (long_name='Inversión privada en capital del sector 2')
    I_3t                ${I_3t}$                (long_name='Inversión privada en capital del sector 3')
    I_1t_O              ${I_1t_O}$              (long_name='Inversión de capital en sector 1 de la familia Ricardiana')
    I_2t_O              ${I_2t_O}$              (long_name='Inversión de capital en sector 2 de la familia Ricardiana')
    I_3t_O              ${I_3t_O}$              (long_name='Inversión de capital en sector 3 de la familia Ricardiana')
//Empalmar I_pt con ecuación pg. 59
    I_pt                ${I_pt}$                (long_name='Inversión real privada')
    KK_t                ${KK_t}$                (long_name='Acervo efectivo de infraestructura')
    K_gt                ${K_gt}$                (long_name='Stock de infraestructura pública instalada')
//Empalmar K_it con ecuación pg. 37 [68]
    K_1t                ${K_1t}$                (long_name='Capital privado instalado en sector 1')
    K_2t                ${K_2t}$                (long_name='Capital privado instalado en sector 2')
    K_3t                ${K_3t}$                (long_name='Capital privado instalado en sector 3')
    K_1t_O    		${K_1t_O}$ 		(long_name='Stock de capital de la familia ricardiana en el sector 1')
    K_2t_O    		${K_2t_O}$ 		(long_name='Stock de capital de la familia ricardiana en el sector 2')
    K_3t_O    		${K_3t_O}$ 		(long_name='Stock de capital de la familia ricardiana en el sector 3')
//Revisar It
    I_t      		${I_t}$ 		(long_name='Saldo nominal de prestamos a la familia no-ricardiana')
//Empalmar Lt con ecuación pg. 32 [44]
    Lr_t     		${Lr_t}$ 		(long_name='Saldo real de prestamos a la familia no-ricardiana')
    l_t      		${l_t}$ 		(long_name='Tasa de apalancamiento de la familia no-ricardiana')
    M_t      		${M_t}$ 		(long_name='Importaciones reales totales')
    M_1t     		${M_1t}$ 		(long_name='Materias primas importadas usadas en el sector 1')
    M_2t     		${M_2t}$ 		(long_name='Materias primas importadas usadas en el sector 2')
    M_3t     		${M_3t}$ 		(long_name='Materias primas importadas usadas en el sector 3')
    M_Ct     		${M_Ct}$ 		(long_name='Importaciones de bienes de consumo')
    M_It     		${M_It}$ 		(long_name='Importaciones de bienes de capital y equipo')
//Empalmar nit con ecuación pg. 42 [88]
    n_1t     		${n_1t}$ 		(long_name='Demanda de trabajo de firmas del sector 1')
    n_2t     		${n_2t}$ 		(long_name='Demanda de trabajo de firmas del sector 2')
    n_3t     		${n_3t}$ 		(long_name='Demanda de trabajo de firmas del sector 3')
//Empalmar PIBNt con ecuación pg. 42 [84]
    PIB_Nt   		${PIB_Nt}$ 		(long_name='PIB nominal')
    PIB_Rt   		${PIB_Rt}$ 		(long_name='PIB real')
    P_1t     		${P_1t}$ 		(long_name='Precio del producto mayorista del sector 1')
    P_2t     		${P_2t}$ 		(long_name='Precio del producto mayorista del sector 2')
    P_Ct     		${P_Ct}$ 		(long_name='Indice de precios de la canasta de bienes de consumo')
    P_Dt     		${P_Dt}$ 		(long_name='Precio del bien domestico')
    P_Et     		${P_Et}$ 		(long_name='Indice de precios de exportaciones')
    P_Gt     		${P_Gt}$ 		(long_name='Indice de precios de la canasta de consumo del gobierno')
    P_It     		${P_It}$ 		(long_name='Precio del bien de inversion')
    P_Mt     		${P_Mt}$ 		(long_name='Precio interno de los bienes importados')
    P_PIBt   		${P_PIBt}$ 		(long_name='Deflactor implicito del PIB')
    P_1t_P    		${P_1t_P}$ 		(long_name='Precio al productor del bien del sector 1')
    P_2t_P    		${P_2t_P}$ 		(long_name='Precio al productor del bien del sector 2')
    P_3t_P    		${P_3t_P}$ 		(long_name='Precio al productor del bien del sector 3')
 //Empalmar PPjit con ecuación pg 27
    PP_1t_j   		${PP_1t_j}$ 		(long_name='Precio minorista de la variedad j en el sector 1')
    PP_2t_j   		${PP_2t_j}$ 		(long_name='Precio minorista de la variedad j en el sector 2')
 //Empalmar Prodit con con ecuación pg. 26
    Prod_1t  		${Prod_1t}$ 		(long_name='Ganancias agregadas de los minoristas del sector 1')
    Prod_2t  		${Prod_2t}$ 		(long_name='Ganancias agregadas de los minoristas del sector 2')
 //Empalmar Prodjit con ecuación pg. 27 [21]
    Prod_1t_j 		${Prod_1t_j}$ 		(long_name='Ganancias generadas por minorista j del sector 1')
    Prod_2t_j 		${Prod_2t_j}$ 		(long_name='Ganancias generadas por minorista j del sector 2')
 //Revisar ProdOt (pg. 34)
    Prod_Ot  		${Prod_Ot}$ 		(long_name='Ganancias de familia Ricardiana')
    fi_Ct   		${fi_Ct}$ 		(long_name='Tasa bruta de inflacion de la canasta de bienes de consumo')
    fi_1t   		${fi_1t}$ 		(long_name='Tasa bruta de inflacion de bien mayorista del sector 1')
    fi_2t   		${fi_2t}$ 		(long_name='Tasa bruta de inflacion de bien mayorista del sector 2')
    fi_Mt   		${fi_Mt}$ 		(long_name='Tasa de inflacion domestica de bienes importados')
//Empalmar rhot con ecuación pg. 40[81]
    ro_t    		${ro_t}$ 		(long_name='Prima de riesgo pais')
    R_t      		${R_t}$ 		(long_name='Tasa de interes nominal domestica')
    R_t_W     		${R_t_W}$ 		(long_name='Tasa bruta de interes externa ajustada por prima de riesgo pais')
//Revisar S_t
    S_t      		${S_t}$ 		(long_name='Tasa de cambio del peso contra el dolar')
    TCR_t               ${TCR_t}$	        (long_name='tasa de cambio real')	
	TI_t            ${TI_t}$	        (long_name='terminos de intercambio')	
	u_1t            ${u_1t}$	        (long_name='costo real de alquiler de capital en el sector 1')	
	u_2t            ${u_2t}$		(long_name='costo real de alquiler de capital en el sector 2')
	u_3t            ${u_3t}$	        (long_name='costo real de alquiler de capital en el sector 3')
// Para V_Gt revisar la pg. 38
	V_Gt            ${V_Gt}$      		(long_name='Ingreso del gobierno por dividendos del sector petrolero*')
	V_Pt            ${V_Pt}$	        (long_name='Pago de dividendos del sector privado al gobierno*')
	W_1t            ${W_1t}$      		(long_name='Salario en sector 1')    
	W_2t            ${W_2t}$      		(long_name='Salario en sector 2')  
	W_3t            ${W_3t}$      		(long_name='Salario en sector 3')
	X_11t           ${X_11t}$	        (long_name='Insumo del sector 1 usado en la producción del sector 1')
	X_12t           ${X_12t}$	        (long_name='Insumo del sector 1 usado en la producción del sector 2')  
	X_13t           ${X_13t}$	        (long_name='Insumo del sector 1 usado en la producción del sector 3')  
	X_21t           ${X_21t}$	        (long_name='Insumo del sector 2 usado en la producción del sector 1')  
	X_22t           ${X_22t}$	        (long_name='Insumo del sector 2 usado en la producción del sector 2')  
	X_23t           ${X_23t}$	        (long_name='Insumo del sector 2 usado en la producción del sector 3')  
	X_31t           ${X_31t}$	        (long_name='Insumo del sector 3 usado en la producción del sector 1')  	
	X_32t           ${X_32t}$	        (long_name='Insumo del sector 3 usado en la producción del sector 2')  	
	X_33t           ${X_33t}$		(long_name='Insumo del sector 3 usado en la producción del sector 3')
	XX_1t          ${XX_1t}$		(long_name='Compras minoristas del bien YY1_t') 
	XX_2t          ${XX_2t}$		(long_name='Compras minoristas del bien YY2_t') 
	XX_j1t          ${XX_j1t}$		(long_name='Compras del minorista j del bien YY1*')
	XX_j2t          ${XX_j2t}$		(long_name='Compras del minorista j del bien YY2*')
	Y_Ct            ${Y_Ct}$		(long_name='Producción del bien de consumo')	
    	Y_Dt            ${Y_Dt}$		(long_name='Producción del bien domestico')
	Y_Gt            ${Y_Gt}$		(long_name='Producción del bien de consumo del gobierno')
	Y_It            ${Y_It}$		(long_name='Producción del bien de inversión')
	//Para todas las ecuaciones de Y_it revisar la ecuación [15] del documento, pg. 26 y sus valores de est. estacionario 
	Y_1t            ${Y_1t}$		(long_name='Producción mayorista del sector 1')
	Y_2t            ${Y_2t}$		(long_name='Producción mayorista del sector 2')  
	YY_1t           ${YY_1t}$		(long_name='Producción bruta del sector 1') 
	YY_2t           ${YY_2t}$		(long_name='Producción bruta del sector 2') 
	YY_3t           ${YY_3t}$		(long_name='Producción bruta del sector 3')
	YY_j1t          ${YY_j1t}$		(long_name='Producción minorista de la variedad j en sector 1*')
	YY_j2t	        ${YY_j2t}$		(long_name='Producción minorista de la variedad j en sector 2*')	
	Z_1t            ${Z_1t}$		(long_name='Monto de Y1,t como insumo en producción del bien doméstico')	
	Z_2t            ${Z_2t}$		(long_name='Monto de Y2,t como insumo en producción del bien doméstico')	
	Z_Gt            ${Z_Gt}$		(long_name='Monto de Y2,t como insumo en el bien de consumo del gobierno')
	omega_t         ${omega_t}$		(long_name='precio sombra de la unidad adicional')
	;
//********************** ******************************
//definiendo variables exogenas   
//********************** ******************************
varexo
//Para cambios de endogeno en las variables de productividad ver pg. 58 del documento
	AA_t_1           ${AA_t_1}$		(long_name='Productividad total de los factores sector 1')
    	AA_t_2           ${AA_t_2}$		(long_name='Productividad total de los factores sector 2')
    	AA_t_3           ${AA_t_3}$		(long_name='Productividad total de los factores sector 3')
	A_t              ${A_t}$		(long_name='Índice de productividad agregada multifactorial')
   	A_t_1            ${AA_t_1}$		(long_name='Índice de productividad específica a sector 1')
    	A_t_2            ${AA_t_2}$		(long_name='Índice de productividad específica a sector 2')
    	A_t_3            ${AA_t_3}$		(long_name='Índice de productividad específica a sector 3')
//Empalmar gamma_Lt con la ecuación de la pg. 32... as: asterisco, para diferenciar las variables internacionales de las domésticas
    	gamma_Lt         ${gamma_Lt}$		(long_name='Tasa bruta de crecimiento del crédito a la familia no Ricardiana')
	g_t_exo          ${g_t_exo}$		(long_name='Gasto corriente del gobierno como % del PIB, dado exógenamente')
	g_Ft             ${g_Ft}$		(long_name='% necesidad de financiación del gobierno con bonos domésticos')
	g_It             ${g_It}$		(long_name='Gasto en infraestructura como % del PIB nominal')
	P_t_oilas 	 ${P_t_oilas}$	 	(long_name='Precio del petroleo en el mercado internacional')
	P_t_cas   	 ${Pt_cas}$		(long_name='Precio externo de la canasta externa de bienes de consumo')
	fi_t_cas 	 ${fi_t_cas}$		(long_name='Tasa bruta de inflacion externa de la canasta de consumo')
	P_t_mas   	 ${P_t_mas}$		(long_name='Precio externo de las importaciones')
	R_t_as    	 ${R_t_as}$		(long_name='Tasa bruta de interes externa')
	R_t_exo   	 ${R_t_exo}$		(long_name='Tasa bruta de interes nominal dada exogenamente u observada')
	tau_Ct     	 ${tau_Ct}$		(long_name='Tasa efectiva de tributacion del consumo')
	tau_It     	 ${tau_It}$		(long_name='Tasa efectiva de tributacion de la inversion')
	tau_Kt     	 ${tau_Kt}$		(long_name='Tasa efectiva de tributacion de la renta de capital')
	tau_Nt     	 ${tau_Nt}$		(long_name='Tasa efectiva de tributacion del ingreso laboral')
	tau_CMt    	 ${tau_CMt}$		(long_name='Arancel efectivo sobre bienes de consumo importados')
	tau_IMt   	 ${tau_IMt}$ 		(long_name='Arancel efectivo sobre bienes de capital y equipo importados')
    	tau_1t_MX        ${tau_1t_MX}$		(long_name='arancel efectivo de materias primas importadas del sector 1')
	tau_2t_MX        ${tau_2t_MX}$		(long_name='arancel efectivo de materias primas importadas del sector 2')
	tau_3t_MX        ${tau_3t_MX}$		(long_name='arancel efectivo de materias primas importadas del sector 3')	
	tau_1t_X         ${tau_1t_X}$		(long_name='tasa de tributacion del consumo intermedio del sector 1')	
	tau_2t_X         ${tau_2t_X}$		(long_name='tasa de tributacion del consumo intermedio del sector 2')	
	tau_3t_X         ${tau_3t_X}$		(long_name='tasa de tributacion del consumo intermedio del sector 3')
	T_Gt             ${T_Gt}$		(long_name='transferencias del gobierno*')	
	T_Pt             ${T_Pt}$		(long_name='transferencias  recibidas por el sector privado*')	
	T_t_NO           ${T_t_NO}$		(long_name='transferencias recibidar por las familias no ricardianas')
	T_t_O            ${T_t_O}$		(long_name='transferencias recibidar por las familias ricardianas')
	V_t_O 	         ${V_t_O}$		(long_name='Pago de dividendos de la familia ricardiana*')	
	v_t	         ${v_t}$		(long_name='Pago de dividendos como % renta de capital del sector petrolero')	
	Yas_t	         ${Yas_t}$		(long_name='PIB Externo')
	;
//********************** *************************
//definiendo parametros
//********************** *************************
parameters    
    	alfa_1		 ${alfa_1}$		(long_name='Elasticidad del valor agregado del sector 1 con respecto al capital')		
 	alfa_2	         ${alfa_2}$		(long_name='Elasticidad del valor agregado del sector 2 con respecto al capital')		
	alfa_3           ${alfa_3}$		(long_name='Elasticidad del valor agregado del sector 3 con respecto al capital')	
	A_1	         ${A_1}$		(long_name='Parámetro de escala de la función de producción del sector 1')	
	A_2              ${A_2}$		(long_name='Parámetro de escala de la función de producción del sector 2')			
	A_3              ${A_3}$		(long_name='Parámetro de escala de la función de producción del sector 3')	
	A_C              ${A_C}$		(long_name='Parámetro de escala de la función de producción del bien de consumo')
	A_D              ${A_D}$		(long_name='Parámetro de escala de la función de producción del bien domestico')        
	A_E              ${A_E}$		(long_name='Parámetro de escala de la función agregacion de exportaciones')	
	A_G              ${A_G}$		(long_name='Parámetro de escala de la función de producción del bien de consumo del gobierno')	
	A_I              ${A_I}$		(long_name='Parámetro de escala de la función de producción del bien de inversion')	
	A_ro             ${A_ro}$		(long_name='Parámetro de escala de la función de prima de riesgo')
	A_X              ${A_X}$		(long_name='Parámetro de escala de la función de demanda de exportaciones')
	beta	         ${beta}$		(long_name='factor subjetivo de descuento')
	ghama 	         ${ghama}$		(long_name='Tasa bruta de crecimiento del PIB por persona en edad de trabajar -15,64- años-')
	dhelta_1	 ${dhelta_1}$		(long_name='Tasa de depreciación del capital en sector 1')
	dhelta_2	 ${dhelta_2}$		(long_name='Tasa de depreciación del capital en sector 2')
	dhelta_3	 ${dhelta_3}$		(long_name='Tasa de depreciación del capital en sector 3')
	dhelta_g	 ${dhelta_g}$		(long_name='Tasa de depreciación de la infraestructura')
	dep		 ${dep}$		(long_name='Relación deuda externa total al PIB')
	dpp		 ${dpp}$		(long_name='Relación deuda pública externa e interna a PIB')
	epsilon		 ${epsilon}$		(long_name='Inverso de la elasticidad de la oferta de trabajo')
	ita_1		 ${ita_1}$		(long_name='Parámetro que define el tamaño de costos de ajuste de la inversión en sector 1')
	ita_2		 ${ita_2}$		(long_name='Parámetro que define el tamaño de costos de ajuste de la inversión en sector 2')
	ita_3		 ${ita_3}$		(long_name='Parámetro que define el tamaño de costos de ajuste de la inversión en sector 3')
	ita_g		 ${ita_g}$		(long_name='Parámetro que define costos de ajuste de la inversión en infraestructura')
	thita		 ${thita}$		(long_name='Elasticidad del valor agregado con respecto al capital público efectivo')
	iota		 ${iota}$		(long_name='Parámetro de política de la Regla de Taylor')
	lamda		 ${lamda}$		(long_name='Porcentaje de la población no-Ricardiana')
	mi_C		 ${mi_C}$		(long_name='Ponderación del insumo doméstico en la producción del bien de consumo')
	mi_D		 ${mi_D}$		(long_name='Ponderación del insumo transable en la producción del bien doméstico')
	mi_E		 ${mi_E}$		(long_name='Peso de exportaciones del bien de consumo en agregado de exportaciones')
	mi_I		 ${mi_I}$		(long_name='Ponderación del insumo doméstico en la producción del bien de inversión')
	xi_1		 ${xi_1}$		(long_name='Coste de ajuste de precios en el sector 1')
	xi_2		 ${xi_2}$		(long_name='Coste de ajuste de precios en el sector 2')
	xi_M		 ${xi_M}$		(long_name='Coste de ajuste de precios en el sector importador')
	//Creo que fi_C y fi_C_as corresponden con lo que serían las 'inflaciones objetivo' y habría que diferenciarlas de las variables
	fi_C		 ${fi_C}$		(long_name='Tasa bruta de inflación de largo plazo de la canasta de bienes de consumo')
	fi_C_as		 ${fi_C_as}$		(long_name='Tasa bruta de inflación externa')
	ro		 ${ro}$			(long_name='Elasticidad del spread con respecto a la deuda externa total')
	zita		 ${zita}$		(long_name='Parámetro de suavización en la regla monetaria')
	sigma_1		 ${sigma_1}$		(long_name='Parámetro de ajuste de gasto en la regla fiscal')
	sigma_2		 ${sigma_2}$		(long_name='Valor absoluto de la elasticidad precio de la demanda de exportaciones')
	fi_1		 ${fi_1}$		(long_name='Parámetro que gobierna el tamaño del "mark up"')
	fi_2		 ${fi_2}$		(long_name='Grado de congestión o rivalidad entre capital público y privado')
	R		 ${R}$			(long_name='Tasa bruta de interés nominal de largo plazo')
	ji_1_1		 ${ji_1_1}$		(long_name='Requerimiento de insumo del sector 1 en la producción bruta del sector 1')
	ji_1_2		 ${ji_1_2}$		(long_name='Requerimiento de insumo del sector 1 en la producción bruta del sector 2')
	ji_1_3		 ${ji_1_3}$		(long_name='Requerimiento de insumo del sector 1 en la producción bruta del sector 3')
	ji_2_1		 ${ji_2_1}$		(long_name='Requerimiento de insumo del sector 2 en la producción bruta del sector 1')
	ji_2_2		 ${ji_2_2}$		(long_name='Requerimiento de insumo del sector 2 en la producción bruta del sector 2')
	ji_2_3		 ${ji_2_3}$		(long_name='Requerimiento de insumo del sector 2 en la producción bruta del sector 3')
	ji_3_1		 ${ji_3_1}$		(long_name='Requerimiento de insumo del sector 3 en la producción bruta del sector 1')
	ji_3_2		 ${ji_3_2}$		(long_name='Requerimiento de insumo del sector 3 en la producción bruta del sector 2')
	ji_3_3		 ${ji_3_3}$		(long_name='Requerimiento de insumo del sector 3 en la producción bruta del sector 3')
	ji_M_1		 ${ji_M_1}$		(long_name='Requerimiento de materias primas importadas en la producción del sector 1')
	ji_M_2		 ${ji_M_2}$		(long_name='Requerimiento de materias primas importadas en la producción del sector 2')
	ji_M_3		 ${ji_M_3}$		(long_name='Requerimiento de materias primas importadas en la producción del sector 3')
	psi_1_NO	 ${psi_1_NO}$		(long_name='Parámetro de desutilidad del trabajo no-Ricardiano en sector 1')
	psi_2_NO	 ${psi_2_NO}$		(long_name='Parámetro de desutilidad del trabajo no-Ricardiano en sector 2')
	psi_3_NO	 ${psi_3_NO}$		(long_name='Parámetro de desutilidad del trabajo no-Ricardiano en sector 3')
	psi_1_O		 ${psi_1_O}$		(long_name='Parámetro de desutilidad del trabajo Ricardiano en sector 1')
	psi_2_O		 ${psi_2_O}$		(long_name='Parámetro de desutilidad del trabajo Ricardiano en sector 2')
	psi_3_O		 ${psi_3_O}$		(long_name='Parámetro de desutilidad del trabajo Ricardiano en sector 3')
	omega_C		 ${omega_C}$		(long_name='Elasticidad de sustitución de Armington entre bienes domésticos e importados')
	omega_D		 ${omega_D}$		(long_name='Elasticidad de sustitución entre bienes transables y no transables')
	//En omega_I tuve que poner algo adicional en el long_name porque repiten la frase igualito que con el omega_C
	omega_I		 ${omega_I}$		(long_name='Elasticidad de sustitución de Armington entre bienes domésticos e importados (en I)')
	;
//********************** *************************
//Estableciendo el valor de los parámetros
//********************** *************************    
	alfa_1 = 0.3987;
	alfa_2 = 0.3234;
	alfa_3 = 0.9223;
	A_1 = 1.8803;
	A_2 = 1.2899;
	A_3 = 0.4832;
	A_C = 1.0190;
	A_D = 1.2000;
	A_E = 1.8563;
	A_G = 1.2000;
	A_I = 1.0103;
	A_ro = 1.0744;
	A_X = 11.5372;
	beta = 0.9603;
	ghama = 1.0200;
	dhelta_1 = 0.0716;
	dhelta_2 = 0.0464;
	dhelta_3 = 0.2473;
	dhelta_g = 0.0351;
	dep = 0.1968;
	dpp = 0.3492;
	epsilon = 1.4550;
	ita_1 = 4.0000;
	ita_2 = 4.0000;
	ita_3 = 4.0000;
	ita_g = 4.0000;
	thita = 0.0700;
	iota = 1.6750;
	lamda = 0.6500;
	mi_C = 0.9456;
	mi_D = 0.3345;
	mi_E = 0.6906;
	mi_I = 0.8012;
	xi_1 = 1.0000;
	xi_2 = 1.0000;
	xi_M = 1.0000;
	fi_C = 1.0300;
	fi_C_as = 1.0167;
	ro = 0.4510;
	zita = 0.4340;
	sigma_1 = 0.0200;
	sigma_2 = 0.4710;
// Cambio el valor del fi: fuente confiable que asegura que es 0
	fi_1 = 0.0000;
	fi_2 = 0.1200;
	R = 1.0940;
	ji_1_1 = 0.2511;
	ji_1_2 = 0.0802;
	// No se necesita ningún insumo del sector transable para la producción bruta del sector petrolero (valor de 0)
	ji_1_3 = 0.0000;
	ji_2_1 = 0.1883;
	ji_2_2 = 0.2526;
	ji_2_3 = 0.0687;
	ji_3_1 = 0.0250;
	// No se necesita ningún insumo del sector petrolero para la producción bruta del sector no transable (valor de 0)
	ji_3_2 = 0.0000;
	ji_3_3 = 0.0822;
	ji_M_1 = 0.1188;
	ji_M_2 = 0.0498;
	//No se necesitan materias primas importadas para la producción del sector petrolero (valor de 0)
	ji_M_3 = 0.0000;
	psi_1_NO = 0.0271;
	psi_2_NO = 0.0042;
	psi_3_NO = 3.1562;
	psi_1_O = 0.0232;
	psi_2_O = 0.0036;
	psi_3_O = 2.7064;
	omega_C = 1.5000;
	omega_D = 0.7500;
	omega_I = 1.5000;

//********************** *************************
//Ecuaciones del modelo
//********************** *************************  
model;
//********************** 
//Firmas sectoriales
//**********************  
// [13] En este tipo de ecuaciones se cancelan los crecimientos y da lo mismo que poner las variables agregadas
	X_21t = ji_2_1 * YY_1t;
// [14]
	X_22t = ji_2_2 * YY_2t;
// [15]
	X_23t = ji_2_3 * YY_3t;
//*************************************
//Mayoristas, minoristas e importadores
//*************************************
// [23] En esta ecuación y en la [24] no cambia nada, porque, nuevamente, se está dividiendo a ambos lados. Para la parte del Y_1t(+1) / Y_1t se divide arriba y abajo sobre el ghama del pib aunque ghama_pibt=ghama_pibt+1=ghama=1.02 en el largo plazo.
	P_1t = (((fi_1 - 1) / fi_1) + (xi_1 / fi_1) * ((fi_1t / fi_C) - 1) * (fi_1t / fi_C) - beta * (xi_1 / fi_1) * (omega_t(+1) / omega_t) * ((fi_1t(+1) / fi_C) - 1) * (fi_1t(+1) / fi_C) * (fi_1t(+1) / fi_C(+1)) * ((Y_1t(+1) / ghama_pibt(+1)) / (Y_1t / ghama_pibt))) ^ (-1) * P_1t_P;               
// [24]
	P_2t = (((fi_1 - 1) / fi_1) + (xi_2 / fi_1) * ((fi_2t / fi_C) - 1) * (fi_2t / fi_C) - beta * (xi_2 / fi_1) * (omega_t(+1) / omega_t) * ((fi_2t(+1) / fi_C) - 1) * (fi_2t(+1) / fi_C) * (fi_2t(+1) / fi_C(+1)) * ((Y_2t(+1) / ghama_pibt(+1)) / (Y_2t / ghama_pibt))) ^ (-1) * P_2t_P; 
// [25] Aquí se utiliza el TCR (Anexo B) en lugar del tipo de cambio nominal (St) del Anexo A, por lo que más adelante tocará definir la ecuación para el tipo de cambio real, al final se multiplica y divide como corresponda por los Pc y Pcm.
	P_Mt = (((fi_1 - 1) / fi_1) + (xi_M / fi_1) * ((fi_Mt / fi_C) - 1) * (fi_Mt / fi_C) - beta * (xi_M / fi_1) * (omega_t(+1) / omega_t) * ((fi_Mt(+1) / fi_C) - 1) * (fi_Mt(+1) / fi_C) * (fi_Mt(+1) / fi_C(+1)) * (M_t(+1) / M_t)) ^ (-1) * TCR_t * (P_t_mas/P_t_cas)*P_Ct;
// [89] Esta es una ecuación del Anexo A que se debe definir en este apartado, ya está estacionarizado, revisar además la ecuación [14] del documento pg. 25, la ecuación de R de la pg. 36 y la ec. [71] del documento	
	TCR_t = S_t;
// [30 (ANEXO A)] ESTA ECUACIÓN NO ESTÁ DADA DE FORMA EXPLÍCITA EN ANEXOS B Y C
	fi_Ct = P_Ct / P_Ct(-1);
// [26] 
	fi_1t = (P_1t / P_1t(-1)) * fi_Ct;
// [27] 
	fi_2t = (P_2t / P_2t(-1)) * fi_Ct;
// [28] 
	fi_Mt = (P_Mt / P_Mt(-1)) * fi_Ct;
//*****************
//El bien doméstico
//*****************
// [29]
	Z_1t = mi_D * (A_D) ^ (omega_D - 1) * (P_1t / P_Dt) ^ (-omega_D) * Y_Dt;
// [30]
	Z_2t = (1 - mi_D) * (A_D) ^ (omega_D - 1) * (P_2t / P_Dt) ^ (-omega_D) * Y_Dt;
// [31] Una vez definidas las ecuaciones de P_1 y P_2 estacionarizadas atrás, no es necesario hacerlo aquí.
	P_Dt = (A_D) ^(-1) * (mi_D * (P_1t) ^ (1 - omega_D) + (1 - mi_D) * (P_2t) ^ (1 - omega_D)) ^ (1 / (1 - omega_D));
//*************************
//Condiciones de equilibrio
//*************************	
// [75] En esta ecuación también se cancelan los crecimientos que dividen a ambos lados para estacionarizar, solo hay que dejar el P_Mt en términos del numerario
	Y_Ct = lamda * C_t_NO + (1 - lamda) * C_t_O + E_Ct + tau_CMt * (P_Mt) * M_Ct;
// [76]
	Y_It = (1 - lamda) * (I_1t_O + I_2t_O + I_3t_O) + I_gt + tau_IMt * (P_Mt/ P_It) * M_It;
// [77] Revisar, en el paper ponen Y_G pero en realidad parece que se refieren a Y_Gt 
	Y_Gt = G_t;
// [78] En esta ecuación también se cancelan los crecimientos que dividen a ambos lados para estacionarizar.
	YY_1t = X_11t + X_12t + X_13t + Y_1t;
// [79]  
	YY_2t = X_21t + X_22t + X_23t + Y_2t;
// [80] 
	YY_3t = X_31t + X_32t + X_33t + E_t_oil;
// [81]
	Y_Dt = D_ct + D_it;
// [82]
	Y_1t = (P_1t) * Z_1t;
// [83]
	Y_2t = P_2t * (Z_2t + Z_Gt);
// [84] Revisar
	ghama * (D_pt_as + D_gt_as) * TCR_t = (R_t_W(-1) / fi_t_cas) * (D_pt_as(-1) + D_gt_as(-1)) * TCR_t + (P_Mt) * M_t - (P_Et) *E_t;


//********************** *************************
//Valores iniciales de las variables
//********************** *************************  
	initval;
	tau_1t_X = 0.048;
	tau_2t_X = 0.083;
	tau_3t_X = 0.116;
	tau_1t_MX = 0.066;
	tau_2t_MX = 0.198;
	tau_3t_MX = 0;
	tau_CMt = 0.461;
	tau_IMt = 0.053;
	tau_It = 0.031;
	tau_Kt = 0.125;
	tau_Nt = 0.048;
	tau_Ct = 0.11;
	v_t = 0.113;
	R_t = 1.094;
	R_t_exo = 1.0052;
	fi_C_as = 1.0167;
	R_t_W = 1.080;
	D_pt_as = 8.8;
	D_gt_as = 10.9;
	B_gt = 24.0;
	g_Ft = 0.69;
	K_1t = 50.3;
	K_2t = 161.0;
	K_3t = 14.8;
	I_1t = 4.6;
	I_2t = 10.7;
	I_3t = 4.0;
	n_1t = 11.95;
	n_2t = 43.06;
	n_3t = 0.45;
// Ecuaciones obtenidas de la pg. 53
	n_1t = h_1t;
	n_2t = h_2t;
	n_3t = h_3t;
	h_1t_NO = h_1t;
	h_1t = h_1t_O;
	h_2t_NO = h_2t;
	h_2t = h_2t_O;
	h_3t_NO = h_3t;
	h_3t = h_3t_O;
// Los autores habían dejado la PTF en 1 pero tras el primer experimento deciden que es mejor que inicie en 0
	A_t = 0;
	A_t_1 = 1;
	A_t_2 = 1;
	A_t_3 = 1;
	AA_t_1 = 0;
	AA_t_2 = 0;
	AA_t_3 = 0;
// ECUACIONES AÑADIDAS (NO ESTÁ EXPLÍCITA EN LOS APÉNDICES, VER PG. 23) (NO SÉ SI SE DEBAN PONER AQUÍ, PERO ME SONÓ).
	AA_t_1 = A_t_1 * A_t;
	AA_t_2 = A_t_2 * A_t;
	AA_t_3 = A_t_3 * A_t;
// ECUACIÓN AÑADIDA (NO ESTÁ EXPLÍCITA EN LOS APÉNDICES, VER PG. 44) (NO SÉ SI SE DEBAN PONER AQUÍ, PERO ME SONÓ).
	gamma_Lt = l_t(+1) / l_t;
	P_t_oilas = TCR_t;
	TCR_t = 1.00;
	P_t_mas = 0.8333;
// Sobre este P_Ct no es explícito en el paper, tal vez no haya necesidad de ponerlo
	P_Ct = 1;
	Yas_t = 1;
	II_gt = 1;
	II_mt = 1;
// Tomado de la pg. 44
	g_t_exo = 0.128;
	T_Gt = 0;
	T_Pt = 0;
	T_t_NO = 0;
	T_t_O = 0;
// Revisar valor del índice de actividad externo (PIB externo)
	BC_t = -1.16;
	B_gt = 24.03;
	C_t_NO = 53.77;
	C_t_O = 77.73;
	D_ct = 71.37;
	D_it = 17.34;
	D_gt_as = 10.88;
	D_pt_as = 8.80;
	E_t = 16.71;
	E_Ct = 11.54;
	E_t_oil = 5.17;
	F_t = 35.62;
	ghama_pibt = 1.02;
	G_t = 12.80;
	g_Ct = 0.128;
// No sé si hay que repetir las de h pero igual lo planteé de esta manera
	h_1t = 11.95;
	h_2t = 43.06;
	h_3t = 0.45;
	h_1t_NO = 11.95;
	h_2t_NO = 43.06;
	h_3t_NO = 0.45;
	I_gt = 2.08;
	I_1t_O = 13.16;
	I_2t_O = 30.52;
	I_3t_O = 11.29;
	K_gt = 37.75;
	K_1t_O = 143.61;
	K_2t_O = 459.95;
	K_3t_O = 42.24;
	l_t = 0.52;
	M_t = 17.87;
	M_1t = 6.10;
	M_2t = 5.46;
	M_3t = 0;
	M_Ct = 2.33;
	M_It = 3.98;
	TI_t = 1.00;
	u_1t = 0.158;
	u_2t = 0.128;
	u_3t = 0.365;
	W_1t = 1.00;
	W_2t = 1.00;
	W_3t = 1.00;
	X_11t = 12.90;
	X_12t = 8.79;
	X_13t = 0;  
	X_21t = 9.67;
	X_22t = 27.71;
	X_23t = 0.48;  
	X_31t = 1.28;
	X_32t = 0;
	X_33t = 0.58;
	Y_Ct = 74.77;
	Y_Dt = 88.71;
	Y_Gt = 12.81;
	Y_It = 21.53;
	Y_1t = 29.67;
	Y_2t = 71.84;
	YY_1t = 51.37;
	YY_2t = 109.71;
	YY_3t = 7.03;	
	Z_1t = 24.73;	
	Z_2t = 49.20;
	Z_Gt = 10.67;
	omega_t = 0.021;

	
//********************** *************************
//Valores finales de algunas variables 
//********************** *************************  
	endval;
// Estas variables toman valor de 0 después de 2027.
	II_gt = 0;
	II_mt = 0;
// Tomado de la pg. 60
	g_t_exo = 0.16;
	fi_Ct = 1.03;
// [A13]
	X_21t = ji_2_1 * YY_1t;
// [A14]
	X_22t = ji_2_2 * YY_2t;
// [A15]
	X_23t = ji_2_3 * YY_3t;
// [A22] 
	P_1t = (fi_1/(fi_1-1));
// [A23] 
	P_2t = (fi_1/(fi_1-1));
// [A24] Revisar 
	P_Mt = (fi_1/(fi_1-1));
// [A25]
	fi_1t = fi_Ct;
// [A26]
	fi_2t = fi_Ct;
// [A27]
	fi_Mt = fi_Ct;
	fi_1t = 1.03;
	fi_2t = 1.03;
	fi_3t = 1.03;
// [A28]
	Z_1t = mi_D * (A_D) ^ (omega_D - 1) * Y_Dt;
// [A29]
	Z_2t = (1 - mi_D) * (A_D) ^ (omega_D - 1) * Y_Dt;
// [A30]
	1 = (A_D) ^(-1) * (mi_D * (P_1t) ^ (1 - omega_D) + (1 - mi_D) * (P_2t) ^ (1 - omega_D)) ^ (1 / (1 - omega_D));
// [A69] 
	Y_Ct = lamda * C_t_NO + (1 - lamda) * C_t_O + E_Ct + tau_CMt * M_Ct;
// [A70]
	Y_It = (1 - lamda) * (I_1t_O + I_2t_O + I_3t_O) + I_gt + tau_IMt * M_It;
// [A71]
	Y_Gt = G_t;
// [A72]
	YY_1t = X_11t + X_12t + X_13t + Y_1t;
// [A73]  
	YY_2t = X_21t + X_22t + X_23t + Y_2t;
// [A74] 
	YY_3t = X_31t + X_32t + X_33t + E_t_oil;
//No olvidar poner el choque a la productividad, experimento 1.
	P_1t = 1.20;
	P_2t = 1.20;
	P_Dt = 1.00;
	P_Et = 1.00;
	P_Gt = 1.00;
	P_It = 1.00;
	P_Mt = 1.00;
	P_PIBt = 1.00;
	P_1t_P = 1.00;
	P_2t_P = 1.00;
	P_3t_P = 1.00;
	PIB_Rt = 100.00;
	
	
	
	

	
