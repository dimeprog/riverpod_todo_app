import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/views/widgets/color_manager.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TodoItem(),
      itemCount: 100,
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      decoration: BoxDecoration(
        color: ColorManager.deepPrimary,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
              blurRadius: 0.2, offset: Offset(3, 4), color: Colors.black12)
        ],
      ),
      child: Center(
        child: ListTile(
          leading: Container(
            height: 2,
            width: 2,
          ),
          trailing: Checkbox(
            onChanged: (val) {},
            value: true,
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.black.withOpacity(.32);
              }
              return Colors.white;
            }),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'cooking on thursday',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '27/09/2022',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
