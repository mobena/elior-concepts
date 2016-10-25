<?php

namespace AppBundle\Form;

use AppBundle\Form\Type\DateTimePickerType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use AppBundle\Entity\ProductStatus;

class ProductType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('shortDescription')
            ->add('longDescription')
            ->add('sku')
            ->add('supplierReference')
            ->add('pricePerUnitHt')
            ->add('createdAt', DateTimePickerType::class, array('disabled' => true))
            ->add('updatedAt', DateTimePickerType::class, array('required' => false, 'disabled' => true))
            ->add('deletedAt', DateTimePickerType::class, array('required' => false, 'disabled' => true))
            ->add('productStatus', EntityType::class, array(
                'class' => 'AppBundle:ProductStatus',
                'choice_label' => 'label',
            ))
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
            'data_class' => 'AppBundle\Entity\Product'
        ));
    }
}
