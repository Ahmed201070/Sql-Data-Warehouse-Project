/*
======================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
======================================================================================
Script Purpose:
This stered procedure loads data into the 'bronze' schema from external CSV files.
It performs the following actions:
- Truncates the bronze tables before loading data.
- Uses the 'BULK INSERT command to load data from csv Files to bronze tables.

Parameters:
    None.
   This stored procedure does not accept any parameters or return any values.


Usage Example:
  EXEC bronze. load bronze;
======================================================================================
*/
CREATE or Alter PROCEDURE bronze.load_bronze AS

BEGIN
	BEGIN TRY	
	--INSERT INTO TABELS :
		--CRM TABELS
	Print'Loading bronze layer';
	Print'=============================================================';

	Print'-------------------------------------------------------------';
	Print'Loading CRM Tabels'
	Print'-------------------------------------------------------------';

	Print '>> Truncating Table : bronze. crm_cust_info '
	TRUNCATE TABLE bronze. crm_cust_info 

	Print '>> Inserting data into Table :bronze. crm_cust_info '

	BULK INSERT bronze. crm_cust_info 
	from'C:\Users\Lenovo\Desktop\cust_info.csv'
	with( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',' ,
			TABLOCK
		);

	Print '>> Truncating Table : bronze.crms_prd_info '

	TRUNCATE TABLE bronze.crms_prd_info 

	Print '>> Inserting data into Table :bronze.crms_prd_info '

	BULK INSERT bronze.crms_prd_info 
	from'C:\Users\Lenovo\Desktop\prd_info.csv'
	with( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',' ,
			TABLOCK
		);

	Print '>> Truncating Table : bronze.crm_sales_details  '

	TRUNCATE TABLE bronze.crm_sales_details

	Print '>> Inserting data into Table :bronze.crm_sales_details  '

	BULK INSERT bronze.crm_sales_details 
	from'C:\Users\Lenovo\Desktop\sales_details.csv'
	with( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',' ,
			TABLOCK
		);
	
	Print'-------------------------------------------------------------';
	Print'Loading ERP Tabels'
	Print'-------------------------------------------------------------';
		
 ------------------------ERP TABELS-------------------------------------------

	Print '>> Truncating Table : bronze.erp_loc_a101'

	TRUNCATE TABLE bronze.erp_loc_a101 

	Print '>> Inserting data into Table :bronze.erp_loc_a101 '

	BULK INSERT bronze.erp_loc_a101         
	from'C:\Users\Lenovo\Desktop\LOC_A101.csv'
	with( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',' ,
			TABLOCK
		);
		 	
	Print '>> Truncating Table : bronze.erp_cust_az12'
		
	TRUNCATE TABLE bronze.erp_cust_az12  

	Print '>> Inserting data into Table :bronze.erp_cust_az12   '

	BULK INSERT bronze.erp_cust_az12          
	from'C:\Users\Lenovo\Desktop\CUST_AZ12.csv'
	with( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',' ,
			TABLOCK
		);

	Print '>> Truncating Table : bronze.erp_px_cat_g1v2 '

	TRUNCATE TABLE bronze.erp_px_cat_g1v2 

	Print '>> Inserting data into Table :bronze.erp_px_cat_g1v2'

	BULK INSERT bronze.erp_px_cat_g1v2          
	from'C:\Users\Lenovo\Desktop\PX_CAT_G1V2.csv'
	with( 
			FIRSTROW = 2,
			FIELDTERMINATOR = ',' ,
			TABLOCK
	    );

	END TRY
	BEGIN CATCH
		PRINT '======================================'
		PRINT 'ERROR OCCURED DURING EXECUTION'
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' +Cast( ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE' +Cast( ERROR_STATE() AS NVARCHAR);
		PRINT '======================================'
	END CATCH
END	
