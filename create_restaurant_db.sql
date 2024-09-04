--¿CUÁLES FUERON LOS 5 PEDIDOS QUE TUVIERON EL MAYOR NUMERO DE ARTICULOS? PISTA: SIEMPRE SE AGRUPA POR LA COLUMNA QUE NO TENGA FUNCION DE AGREGACIÓN.
select *from order_details;

select order_id, COUNT (item_id)
FROM order_details
group by order_id
	having count (item_id)<>0
order by COUNT(item_id) DESC
limit 5;

--.- Realizar un left join entre entre order_details y menu_items con el identificador
-- item_id(tabla order_details) y menu_item_id(tabla menu_items).

SELECT*
FROM order_details AS o
LEFT JOIN menu_items AS m
ON o.item_id=m.menu_item_id;

--CUÁLES FUERON LOS PLATILLOS MÁS VENDIDOS DEL MENU.

select count(o.order_id), m.item_name
FROM order_details AS o
LEFT JOIN menu_items as m
on o.item_id=m.menu_item_id
GROUP BY m.item_name
order by count (o.order_id) desc
limit 3;