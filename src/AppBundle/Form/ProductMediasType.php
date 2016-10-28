<?php

namespace AppBundle\Form;

use AppBundle\Form\Type\DateTimePickerType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use AppBundle\Entity\ProductMediaType;
use AppBundle\Entity\Product;

class ProductMediasType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('description')
            ->add('comment')
            ->add('mediaPath', TextType::class, array('label' => 'Media path (400x400)'))
            ->add('productMediaType', EntityType::class, array(
                'class' => 'AppBundle:ProductMediaType',
                'choice_label' => 'label',
            ))
            ->add('product', EntityType::class, array(
                'class' => 'AppBundle:Product',
                'choice_label' => 'name',
            ))
            ->add('createdAt', DateTimePickerType::class, array('disabled' => true))
            ->add('updatedAt', DateTimePickerType::class, array('required' => false, 'disabled' => true))
            ->add('deletedAt', DateTimePickerType::class, array('required' => false, 'disabled' => true))
            ->add('creator', EntityType::class, array(
                'class' => 'AppBundle:User',
                'choice_label' => 'username',
            ))
            ->add('updator', EntityType::class, array(
                'class' => 'AppBundle:User',
                'choice_label' => 'username',
            ))
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\ProductMedia'
        ));
    }
}
