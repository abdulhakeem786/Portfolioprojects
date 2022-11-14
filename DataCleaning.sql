--select *
--from [Portfolio pro].dbo.nationalhousing

--select SaleDate, CONVERT(Date,SaleDate) as SalesConvertedDate
--from [Portfolio pro].dbo.nationalhousing


--UPDATE [Portfolio pro].dbo.nationalhousing
--SET SaleDate = CONVERT(Date,SaleDate)

--ALTER TABLE [Portfolio pro].dbo.nationalhousing
--Add SaleDateConverted Date ;

--UPDATE [Portfolio pro].dbo.nationalhousing
--SET SaleDateConverted = CONVERT(Date,SaleDate)

--select propertyAddress
--from [Portfolio pro].dbo.nationalhousing

--select *
--from [Portfolio pro].dbo.nationalhousing
--order by ParcelID

--select a.ParcelID  , a.PropertyAddress,
--b.ParcelID,b.PropertyAddress,
--ISNULL (a.PropertyAddress,b.PropertyAddress)
--from [Portfolio pro].dbo.nationalhousing a
--JOIN [Portfolio pro].dbo.nationalhousing b
--	on a.parcelID = b.parcelID
--	AND a.[uniqueID] <> b.[uniqueID]
--Where a.PropertyAddress is null

--Update a
--SET propertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
--from [Portfolio pro].dbo.nationalhousing a
--JOIN [Portfolio pro].dbo.nationalhousing b
--	on a.parcelID = b.parcelID
--	AND a.[uniqueID] <> b.[uniqueID]
--Where a.PropertyAddress is null

select PropertyAddress
from [Portfolio pro].dbo.nationalhousing

select 
SUBSTRING(PropertyAddress, 1,CHARINDEX(',',PropertyAddress) -1) as Address
, SUBSTRING (PropertyAddress, CHARINDEX(',',PropertyAddress) +1 , LEN(PropertyAddress)) as Address
from [Portfolio pro].dbo.nationalhousing


--ALTER TABLE [Portfolio pro].dbo.nationalhousing
--Add PropertySplitAddress Nvarchar(255) ;

--UPDATE [Portfolio pro].dbo.nationalhousing
--SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1,CHARINDEX(',',PropertyAddress) -1) 


--ALTER TABLE [Portfolio pro].dbo.nationalhousing
--Add PropertySplitCity Varchar(255) ;


--UPDATE [Portfolio pro].dbo.nationalhousing
--SET PropertySplitCity = 
--SUBSTRING (PropertyAddress, CHARINDEX(',',PropertyAddress) +1 , LEN(PropertyAddress)) 

select OwnerAddress
from [Portfolio pro].dbo.nationalhousing

select 
PARSENAME(REPLACE(OwnerAddress,',','.'),3),
PARSENAME(REPLACE(OwnerAddress,',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),1)
from [Portfolio pro].dbo.nationalhousing

select Distinct(SoldAsVacant),COUNT(SoldAsVacant) as count

from [Portfolio pro].dbo.nationalhousing
Group by SoldAsVacant
order by count

select SoldAsVacant
, CASE When SoldAsVacant ='Y' THEN 'Yes'
		When SoldAsVacant = 'N' THEN 'No'
		ELSE SoldAsVacant
		END
from [Portfolio pro].dbo.nationalhousing

Update [Portfolio pro].dbo.nationalhousing
SET SoldAsVacant=CASE 
		When SoldAsVacant ='Y' THEN 'Yes'
		When SoldAsVacant = 'N' THEN 'No'
		ELSE SoldAsVacant
		END
WITH RowNumCTE as (
select *,
	ROW_NUMBER() OVER(
	PARTITION BY ParcelID,	
					propertyAddress,SalePrice,SaleDate,LegalReference
				ORDER BY UniqueID
				) row_num
from [Portfolio pro].dbo.nationalhousing
--order by parcelID
)
select *
from RowNumCTE
where row_num > 1
order by PropertyAddress











