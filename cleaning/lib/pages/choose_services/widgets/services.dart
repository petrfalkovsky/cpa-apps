import 'package:flutter/material.dart';
import 'package:cleaning/config/config.dart';
import 'package:cleaning/models/services.dart';

class Services extends StatefulWidget {
  final ServicesModel services;
  final double? width;
  final int? maxCount;
  final bool isGarbageCollection;
  final Function(int currentPrice, int count) onTap;

  const Services({
    Key? key,
    required this.services,
    this.width,
    this.maxCount,
    this.isGarbageCollection = false,
    required this.onTap,
  }) : super(key: key);

  @override
  ServicesState createState() => ServicesState();
}

class ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Row(
            children: [
              const Text(
                '+ ',
                style: TextStyle(
                  fontSize: 13,
                  color: AppConfig.blueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${widget.services.name} ',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${widget.services.price} ${widget.services.currency}',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppConfig.blueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (widget.services.count == 0) {
              setState(() {});
              widget.services.count += 1;
            }
            widget.onTap(widget.services.price, widget.services.count);
          },
          child: Container(
            width: widget.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              gradient: const LinearGradient(
                colors: [
                  AppConfig.textFieldGradientStart,
                  AppConfig.textFieldGradientEnd,
                ],
              ),
            ),
            child: widget.services.count == 0
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Добавить',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppConfig.whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : widget.isGarbageCollection
                    ? GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          if (widget.services.count > 0) {
                            setState(() {
                              widget.services.count -= 1;
                            });
                            widget.onTap(
                                -widget.services.price, widget.services.count);
                          } else {
                            setState(() {
                              widget.services.count += 1;
                            });

                            widget.onTap(
                                widget.services.price, widget.services.count);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Исполнится',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppConfig.whiteColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Image.asset(
                                'assets/images/comet.png',
                                width: 14,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              if (widget.services.count > 0) {
                                setState(() {
                                  widget.services.count -= 1;
                                });
                                widget.onTap(-widget.services.price,
                                    widget.services.count);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: const [
                                  SizedBox(width: 15),
                                  Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppConfig.whiteColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '${widget.services.count}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppConfig.whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              if (widget.maxCount != null) {
                                if (widget.services.count < widget.maxCount!) {
                                  setState(() {
                                    widget.services.count += 1;
                                  });
                                  widget.onTap(widget.services.price,
                                      widget.services.count);
                                }
                              } else {
                                setState(() {
                                  widget.services.count += 1;
                                });
                                widget.onTap(widget.services.price,
                                    widget.services.count);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: const [
                                  SizedBox(width: 15),
                                  Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppConfig.whiteColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
          ),
        )
      ],
    );
  }
}
