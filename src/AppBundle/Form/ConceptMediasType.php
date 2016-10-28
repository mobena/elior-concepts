<?php

namespace AppBundle\Form;

use AppBundle\Form\Type\DateTimePickerType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use AppBundle\Entity\User;
use AppBundle\Entity\Concept;
use AppBundle\Entity\ConceptMediaType;

class ConceptMediasType extends AbstractType
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
            ->add('mediaPath', TextType::class, array('label' => 'Media path (2000x500 for banner, 400x400 for image)'))
            ->add('createdAt', DateTimePickerType::class, array('disabled' => true))
            ->add('updatedAt', DateTimePickerType::class, array('required' => false, 'disabled' => true))
            ->add('deletedAt', DateTimePickerType::class, array('required' => false, 'disabled' => true))
            ->add('concept', EntityType::class, array(
                'class' => 'AppBundle:Concept',
                'choice_label' => 'name',
            ))
            ->add('conceptMediaType', EntityType::class, array(
                'class' => 'AppBundle:ConceptMediaType',
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
            'data_class' => 'AppBundle\Entity\ConceptMedia'
        ));
    }
}
