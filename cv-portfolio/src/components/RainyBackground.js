import React, { useRef, useMemo } from "react";
import { Canvas, extend, useFrame } from "@react-three/fiber"
import { Vector3, CatmullRomCurve3 } from 'three';
import * as meshline from 'three.meshline'

extend(meshline)

const colors = ["rgb(175, 187, 182)", "rgb(149, 173, 190)"];
function Fatline({ curve, width, color, speed }) {
  const material = useRef()
  useFrame(() => (material.current.uniforms.dashOffset.value -= speed))
  return (
    <mesh>
      <meshLine attach="geometry" points={curve} />
      <meshLineMaterial attach="material" ref={material} transparent depthTest={false} lineWidth={width} color={color} dashArray={0.1} dashRatio={0.9} />
    </mesh>
  )
}

function Lines({ count, colors }) {
  const lines = useMemo(
    () =>
      new Array(count).fill().map(() => {
        const pos = new Vector3(10 - Math.random() * 20, 10 - Math.random() * 20, 10 - Math.random() * 20)
        const points = new Array(30).fill().map(() => pos.add(new Vector3(4 - Math.random() * 8, 4 - Math.random() * 8, 2 - Math.random() * 4)).clone())
        const curve = new CatmullRomCurve3(points).getPoints(1000)
        return {
          color: colors[parseInt(colors.length * Math.random())],
          width: Math.max(0.1, 0.2 * Math.random()),
          speed: Math.max(0.0001, 0.0005 * Math.random()),
          curve
        }
      }),
    [colors, count]
  )
  return lines.map((props, index) => <Fatline key={index} {...props} />)
}

const RainyBackground = () => {
  return <Canvas linear camera={{ position: [0, 0, 20], fov: 90 }}>
    <Lines count={20} colors={colors} />
  </Canvas>
};

export default RainyBackground;
