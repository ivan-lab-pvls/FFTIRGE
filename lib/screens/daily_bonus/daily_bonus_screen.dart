import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_tiger_game_app/screens/daily_bonus/bloc/daily_bonus_bloc.dart';
import 'package:fortune_tiger_game_app/theme/colors.dart';
import 'package:fortune_tiger_game_app/widgets/action_button_widget.dart';
import 'package:fortune_tiger_game_app/widgets/scores_panel/bloc/scores_bloc.dart';
import 'package:fortune_tiger_game_app/widgets/scores_panel/scores_panel.dart';
import 'package:stroke_text/stroke_text.dart';

@RoutePage()
class DailyBonusScreen extends StatefulWidget {
  const DailyBonusScreen({super.key});

  @override
  State<DailyBonusScreen> createState() => _DailyBonusScreenState();
}

class _DailyBonusScreenState extends State<DailyBonusScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/fortune-game-images/background.png",
          height: media.height,
          width: media.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset('assets/images/lobby-images/top-image.png',
                      width: media.width,
                      fit: BoxFit.fill),
                  Container(
                      color: AppColors.yellow,
                      height: 5,
                      width: double.infinity),
                ],
              ),
              BlocConsumer<DailyBonusBloc, DailyBonusState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is FailureGetBonusState) {
                    return SizedBox(
                      height: media.height * 0.4,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                  'assets/images/elements/grey-popup-large.png'),
                            ),
                          ),
                          Positioned(
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 250,
                                child: Stack(
                                  children: <Widget>[
                                    Text(
                                      textAlign: TextAlign.center,
                                      'You Already Have Daily Bonus',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = AppColors.darkred,
                                      ),
                                    ),
                                    // Solid text as fill.
                                    Text(
                                      textAlign: TextAlign.center,
                                      'You Already Have Daily Bonus',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: media.height * 0.4,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                  'assets/images/elements/yellow-popup-small.png'),
                            ),
                          ),
                          Positioned(
                            child: Align(
                              alignment: Alignment.center,
                              child: StrokeText(
                                text: 'Daily bonus Name',
                                strokeWidth: 5,
                                strokeColor: AppColors.darkred,
                                textStyle: TextStyle(
                                  fontSize: 22,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                  'assets/images/elements/diamond-large.png', width: media.width * 0.3,),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              ActionButtonWidget(
                  title: 'OK',
                  onTap: () {
                    context.read<ScoresBloc>().add(UpdateScoresEvent());
                    context.router.pop();
                  }),
              ScoresPanel(),
            ],
          ),
        ),
        SafeArea(
          child: Positioned(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      context.router.pop();
                    },
                    child:
                        Image.asset('assets/images/elements/close-button.png'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
