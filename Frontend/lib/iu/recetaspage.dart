import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutridaiet/controllers/recetas_controller.dart';
import 'package:nutridaiet/iu/customWidgets/list_view_scroll_widget.dart';
import 'package:nutridaiet/iu/customWidgets/file_upload_dialog.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'customWidgets/button_app.dart';
import 'customWidgets/grid_view_scroll_widget.dart';
import 'customWidgets/logo.dart';

class RecetasPage extends ConsumerStatefulWidget {
  const RecetasPage({Key? key}) : super(key: key);

  @override
  _RecetasPageState createState() => _RecetasPageState();
}

class _RecetasPageState extends ConsumerState<RecetasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 1200,
              color: const Color(0xFFc7cedf),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Logo(),
                  Expanded(
                    flex: 8,
                    child: ListContainer(
                        list: const GridViewScrollWidget(height: 500),
                        title: "Recetas",
                        optionButton: buttonSlider(context)),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListContainer(
                      list: const ListViewScrollWidget(),
                      title: "Despensa",
                      optionButton: buttonTicket(context),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  ButtonApp buttonTicket(BuildContext context) {
    return ButtonApp(
      text: "Subir ticket",
      icon: const Icon(Icons.cloud_upload),
      onPressed: () => {
        showDialog(
            context: context,
            builder: (BuildContext context) => const PruebaDialog())
      },
    );
  }

  buttonSlider(BuildContext context) {
    return ButtonApp(
        text: "Rango calorias",
        icon: const Icon(Icons.local_fire_department_outlined),
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => DialogCalories()));
  }
}

class DialogCalories extends StatefulWidget {
  const DialogCalories({Key? key}) : super(key: key);

  @override
  _DialogCaloriesState createState() => _DialogCaloriesState();
}

class _DialogCaloriesState extends State<DialogCalories> {
  @override
  Widget build(BuildContext context) {
    SfRangeValues _values = SfRangeValues(1000, 4000);
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.2,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
                child: SfRangeSlider(
                  stepSize: 10,
                  dragMode: SliderDragMode.onThumb,
                  min: 0,
                  max: 5000,
                  values: _values,
                  interval: 500,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 1,
                  onChanged: (SfRangeValues values) {
                    setState(() {
                      _values = values;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ButtonApp(
                        text: "Enviar",
                        icon: Icon(Icons.send),
                        onPressed: () => {}),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListContainer extends StatelessWidget {
  final Widget list;
  final String title;
  final ButtonApp optionButton;

  const ListContainer({
    Key? key,
    required this.list,
    required this.title,
    required this.optionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: 1100,
            color: Colors.white.withAlpha(100),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style:
                            const TextStyle(fontSize: 22, fontFamily: 'Arvo'),
                      ),
                      optionButton
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: list,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
