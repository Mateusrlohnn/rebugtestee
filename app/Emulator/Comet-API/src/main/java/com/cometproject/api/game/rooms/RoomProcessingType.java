package com.cometproject.api.game.rooms;

import javax.annotation.Nullable;

public enum RoomProcessingType {
    DEFAULT(0, "padrao", "Nitro padrão (ordem de entrada)"),
    CLICK(1, "futebol", "Nitro Futebol por prioridade de clique."),
    RANDOM(2, "aleatorio", "Nitro aleatório."),
    PRESSURE(3, "pressao", "Nitro Rebug com pressão, ângulos e proteção contra roubos repetidos."),
    ;

    private final String description;
    private final byte key;
    private final String name;

    RoomProcessingType(int key, String name, String description) {
        this.key = (byte) key;
        this.name = name;
        this.description = description;
    }

    public static RoomProcessingType parse(String str) {
        switch (str.toLowerCase()) {

            case "rnd":
            case "random":
            case "aleatorio":
            case "2":
                return RoomProcessingType.RANDOM;

            case "click":
            case "habb":
            case "fut":
            case "futnitro":
            case "nitro":
            case "on":
            case "1":
                return RoomProcessingType.CLICK;

            case "pressure":
            case "pressao":
            case "rebug":
            case "3":
                return RoomProcessingType.PRESSURE;


            default:
                return RoomProcessingType.DEFAULT;
        }


    }

    public String getDescription() {
        return description;
    }

    public byte getKey() {
        return key;
    }

    public String getName() {
        return name;
    }
}
