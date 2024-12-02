package org.example;

import com.mongodb.client.*;
import org.bson.Document;


import static com.mongodb.client.model.Filters.gt;
import static com.mongodb.client.model.Updates.set;
import static com.mongodb.client.model.Filters.eq;

public class Main {

    public static void crearProductos(MongoCollection<Document> collection, String id, String nombre, String descripcion, double precio, int stock){
        collection.insertOne(
                new Document("_id",id)
                        .append("nombre",nombre)
                        .append("descripcion",descripcion)
                        .append("precio",precio)
                        .append("precio",stock)
        );
    }
    public static void crearPedidos(MongoCollection<Document> collection, String id, String cliente, String fecha_pedido, String estado, double total){
        collection.insertOne(
                new Document("_id",id)
                        .append("cliente",cliente)
                        .append("fecha_pedido",fecha_pedido)
                        .append("estado",estado)
                        .append("total",total)
        );
    }
    public static void crearDetalle_Pedidos(MongoCollection<Document> collection, String id, String pedido_id, String producto_id, int cantidad, double precio_unitario){
        collection.insertOne(
                new Document("_id",id)
                        .append("pedido_id",pedido_id)
                        .append("producto_id",producto_id)
                        .append("cantidad",producto_id)
                        .append("precio_unitario",producto_id)
        );
    }

    public void updateProductos(MongoCollection<Document> collection, String id, double precio){
        collection.updateOne(eq("_id", id), set("precio",precio));
    }

    public void updatePedidos(MongoCollection<Document> collection,String id, String estado){
        collection.updateOne(eq("_id",id), set("estado", estado));
    }
    public void updateDetalle_Pedidos(MongoCollection<Document> collection, String id,int cantidad){
        collection.updateOne(eq("_id",id), set("cantidad",cantidad));
    }
    public void deleteProductos(MongoCollection<Document> collection,String id){
        collection.deleteOne(eq("_id",id ));
    }
    public void deletePedidos(MongoCollection<Document> collection,String id){
        collection.deleteOne(eq( "_id",id ));
    }
    public void deleteDetalle_Pedidos(MongoCollection<Document> collection,String id){
        collection.deleteOne(eq( "_id",id ));
    }

    public FindIterable readProductos(MongoCollection<Document> collection, String id){
        return collection.find(eq("_id",id ));
    }
    public FindIterable readPedidos(MongoCollection<Document> collection, String id){
        return collection.find(eq("_id",id ));
    }
    public FindIterable readDetalle_Pedidos(MongoCollection<Document> collection, String id){
        return collection.find(eq("_id",id ));
    }

    public static void productosmayoresa20(MongoCollection<Document> collection){
        Document cond = new Document("precio", new Document("$gt", 20.00));
        FindIterable<Document> resultados = collection.find(cond);
        for (Document doc : resultados) {
            System.out.println(doc.toJson());
        }
    }
    public static void pedidosmayoresa100(MongoCollection<Document> collection){
        Document cond = new Document("total", new Document("$gt", 100));
        FindIterable<Document> resultados = collection.find(cond);
        for (Document doc : resultados) {
            System.out.println(doc.toJson());
        }
    }
    public static void Detalle_Pedidosbusca(MongoCollection<Document> collection){
        FindIterable<Document> resultados = collection.find(eq("producto_id","producto001" ));
        for (Document doc : resultados) {
            System.out.println(doc.toJson());
        }
    }
    public void obtenerreservasencilla(MongoCollection<Document> collection){
        FindIterable<Document> resultados = collection.find(eq("habitacion.tipo", "sencilla"));
        for (Document doc : resultados) {
            System.out.println(doc.toJson());
        }
    }

    public void obtenerreservaprecionoche(MongoCollection<Document> collection){
        FindIterable<Document> resultados = collection.find(gt("habitacion.precio_noche", 100.00));
        for (Document doc : resultados) {
            System.out.println(doc.toJson());
        }
    }

    public static void crearReserva(
            MongoCollection<Document> collection,
            String id, String nombreCliente, String correoCliente, String telefonoCliente, String direccionCliente,
            String tipoHabitacion, int numeroHabitacion, double precioNoche, int capacidadHabitacion, String descripcionHabitacion,
            String fechaEntrada, String fechaSalida, double total, String estadoPago, String metodoPago, String fechaReserva) {
        Document cliente = new Document("nombre", nombreCliente)
                .append("correo", correoCliente)
                .append("telefono", telefonoCliente)
                .append("direccion", direccionCliente);

        Document habitacion = new Document("tipo", tipoHabitacion)
                .append("numero", numeroHabitacion)
                .append("precio_noche", precioNoche)
                .append("capacidad", capacidadHabitacion)
                .append("descripcion", descripcionHabitacion);

        Document reserva = new Document("_id", id)
                .append("cliente", cliente)
                .append("habitacion", habitacion)
                .append("fecha_entrada", fechaEntrada)
                .append("fecha_salida", fechaSalida)
                .append("total", total)
                .append("estado_pago", estadoPago)
                .append("metodo_pago", metodoPago)
                .append("fecha_reserva", fechaReserva);
        collection.insertOne(reserva);
    }
    public static void deleteReserva(MongoCollection<Document> collection,String id){
        collection.deleteOne(eq("_id",id ));
    }
    public static void updateReserva(MongoCollection<Document> collection,String id,String metodoPago){
        collection.updateOne(eq("_id",id), set("metodo_pago", metodoPago));
    }
    public static void main(String[] args) {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("examen");
        MongoCollection<Document> productoscollection = database.getCollection("productos");
        MongoCollection<Document> Pedidoscollection = database.getCollection("Pedidos");
        MongoCollection<Document> Detalle_Pedidoscollection = database.getCollection("Detalle_Pedidos");
        MongoCollection<Document> reservacollection = database.getCollection("reserva");
        crearProductos(productoscollection ,"producto001"," Camiseta de algodon","camiseta",15.99,200);
        crearPedidos(Pedidoscollection,"pedido001","cliente001","2024-12-01","Enviado",31.98);
        crearDetalle_Pedidos(Detalle_Pedidoscollection,"detalle001","pedido001","producto001",2,15.99);
        productosmayoresa20(productoscollection);
        pedidosmayoresa100(Pedidoscollection);
        Detalle_Pedidosbusca(Detalle_Pedidoscollection);
    }
}