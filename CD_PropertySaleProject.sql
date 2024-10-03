select * from [dbo].['HousingData']


select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress,isnull(a.PropertyAddress,b.PropertyAddress)
from [dbo].['HousingData'] a
join [dbo].['HousingData'] b
on a.ParcelID = b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null
order by a.ParcelID

update a 
select a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress,isnull(a.PropertyAddress,b.PropertyAddress)
from [dbo].['HousingData'] a
join [dbo].['HousingData'] b
on a.ParcelID = b.ParcelID
and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null



---------------------------------------------------------------


select
PARSENAME(Replace(PropertyAddress,',','.'),2) as Property_Street
,PARSENAME(Replace(PropertyAddress,',','.'),1) as Property_State
from [dbo].['HousingData']


alter table [dbo].['HousingData']
add Property_Street nvarchar(255);


update [dbo].['HousingData']
set Property_Street = PARSENAME(Replace(PropertyAddress,',','.'),2)


alter table [dbo].['HousingData']
add Property_State nvarchar(255);


update [dbo].['HousingData']
set Property_State = PARSENAME(Replace(PropertyAddress,',','.'),1)



---------------------------------------------------------------



select Distinct(SoldAsVacant),count(SoldAsVacant)
from [dbo].['HousingData']
group by SoldAsVacant
order by 2


select SoldAsVacant,
case
when SoldAsVacant = 'Y' then 'Yes'
when SoldAsVacant = 'N' then 'No'
else SoldAsVacant
end
from [dbo].['HousingData']


update [dbo].['HousingData']
set SoldAsVacant = case
when SoldAsVacant = 'Y' then 'Yes'
when SoldAsVacant = 'N' then 'No'
else SoldAsVacant
end



---------------------------------------------------------------



select
PARSENAME(Replace(Owner_Address,',','.'),3) as Owner_Street
,PARSENAME(Replace(Owner_Address,',','.'),2) as Owner_City
,PARSENAME(Replace(Owner_Address,',','.'),1) as Owner_State
from [dbo].['HousingData']


alter table [dbo].['HousingData'] 
add Owner_Street nvarchar(255);


update [dbo].['HousingData']
set Owner_Street = PARSENAME(Replace(Owner_Address,',','.'),3)


alter table [dbo].['HousingData']
add Owner_City nvarchar(255);


update [dbo].['HousingData']
set Owner_City  = PARSENAME(Replace(Owner_Address,',','.'),2)


alter table [dbo].['HousingData']
add Owner_State  nvarchar(255);


update [dbo].['HousingData']
set Owner_State  = PARSENAME(Replace(Owner_Address,',','.'),1)


select * from [dbo].['HousingData']



---------------------------------------------------------------



select SaleDate
from [dbo].['HousingData']


select SaleDate,CONVERT(date,SaleDate) as SaleDateConverted
from [dbo].['HousingData']


alter table [dbo].['HousingData']
add SaleDateConverted Date;


update [dbo].['HousingData']
set SaleDateConverted = CONVERT(date,SaleDate)




---------------------------------------------------------------




with RowNUmCTE AS
(
select *,
ROW_NUMBER() over (
PARTITION BY ParcelID,
             PropertyAddress,
			 SalePrice,
			 SaleDate,
			 LegalReference
			 order by 
			 UniqueID) row_num
from [dbo].['HousingData']
--order by ParcelID
)
select *
from RowNUmCTE
where row_num > 1
order by PropertyAddress



alter table [dbo].['HousingData']
drop column Owner_Address,SaleDate,PropertyAddress




---------------------------------------------------------------