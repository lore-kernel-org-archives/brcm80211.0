Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D97237F018
	for <brcm80211@lists.linux.dev>; Wed, 29 Apr 2026 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458625; cv=none; b=XVipi42lkzJBKb2K/G6iQAtqOvDXlGjN73s7s7LDkaqvmVPdwHPuUkUZz37Zqau7wH+m6IZbI6iow4XopC+iXQeAqQBY4FZR1XOaw+QKMTeIKQMKAXsZeDJRg+hiJUugCmKVdakIcongxIgB0jI4YFEii94xedPP7clTs/BufRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458625; c=relaxed/simple;
	bh=8k+/eJ+oplAKwa6y8hgdOMX1aMdC7hSdvQ+WDtJexew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b//gt07hlS8NbwD6myle8QO4HDMf1JPhtegkvkDjsNvA/jVZJAvr3d8IsDX2hykwbAI3Sqn7hsodtcJ3MgMv5dDiPgmGACzOAF70Ev1NfbYmG1RMIN8RrpxyBq1JcAVaBTV5rGwEd0MlpE/0j8jUDBQz/vHeECxAdiNiKzXMwVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=jiDCr8BS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="jiDCr8BS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso174863465e9.3
        for <brcm80211@lists.linux.dev>; Wed, 29 Apr 2026 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777458622; x=1778063422; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4K3CX6fQVp3G5LFrOMSsx2n8N4FljSdUREsN/3Z40rY=;
        b=jiDCr8BSks3lzO6/WUmTzlBHrKAI2yUdBLuIUXuxbUq7sI+l8pPJi8ZyAHpZu2uMDk
         jl+qbTL0UvghseUIdXzKYxBMP2o/g47g0nP3gLxONDNi23b+Dd9oxbbNELSAXQ0Foo65
         QcA0oOv7hJS4D8vLeRdxWhZKDj5VwX+pA1Q8vgOJs/nTf+GKczlJGZoz5L+lsRFXoIHr
         DaLOoNyTmHIzrsdk8Lzxu0f94lDdduIOWB9T7w41zMp+FktpPCwQkvQgcHNd4Rn3Enz8
         hrLRc9yjXKzNRILDTGZqn1NjNP4i9XjHxgZPhQaXKADF+4AbCuiTfRVMHY/CQsshfLER
         CahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777458622; x=1778063422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4K3CX6fQVp3G5LFrOMSsx2n8N4FljSdUREsN/3Z40rY=;
        b=dHvwwXSROVsuH1bZ775m2vKIErROLXus0FMvw9cjHUuiZnTTKyzajrazbOS1KOFcLb
         5Wc8qH6/QXTqCgs5SdduPJ3rNZzNSgiRbLQQi2azvIOWMJX2CIR468JflsivdbNuOjVc
         rvn1WNhDbL18kamibHTTMXgzyOOcbxNv0J2sidJA8yYgqOB+AK+GQk3oriNnDUaMQUey
         y6gEcVNZmWypDqUtxd7ZCxTEPmkh60TQCpWeGVGHSlbsSZi5tlXwonYIQzNeoWq2GJyN
         ptrtl57RqMGtFd2ZhQ0O6cZOgQfNdW8lyaaF9E161+9z93fbULHvYJ4UiW9yIiXfctZW
         BlQQ==
X-Forwarded-Encrypted: i=1; AFNElJ92QVNHDqsnyTSRs8YFbccoyMAnFL0Lmlc9C6xX4Sxix7sNJmR5ghabHEAFb33VZ2m+64+eq3bIuS4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz10v2wULhECgj8nsqqjvIxtA5TtT0kMqX1U4AWbmfxC4hTZ8aX
	KYkwxP55O0A8yxscQGhrjak/39wbF5RFnuZMXmz8cPznwaLZ3j1wtoVrDxPQJdasO4w=
X-Gm-Gg: AeBDieuZV6W0xS+euk/UfweVVGmeeEeMgR6RcoEV69aHBTjafmZ4zmEDSTQIO/hR8ZV
	A0yFvTeXn7sX+1wvndkB1HaDJQO9drkxltQmNX3SIY40iemWQYDy0qfHFcoJBIXui1kU+pSgJIq
	LXt7AD5qlZ/MwMvwhhBofAO0IK7PS26apPh/8c0L0tGdLE0fzkyFKosGCRUUwLDIUFrrVyRu182
	86aweuix7UAorBjZqtaLuqh626MHq9lhKvIdsQ8Wc3OzRWbQOLzW654SlkAlFkCJk2aVKaWWp85
	txVrNECPpiZ4ai0Z95vaf8ePUG0d2JzWHJK+v2lSTtbX1c0FfHHgYiRe3V+nXRgxHZfUQ2Qof1l
	HiUs4eC1eqBynKrAtOza9DRESgVeecgj4YLJpIF3FLz5C7yVtU5oDYJO3J8K7yc8rNJpQX/wwrZ
	+8Jc25Cxj0zqn+Mxi2vI+mtZv9H7GDilgItwDPWieEE0kB4gY1qrJeqnPjWATIxglP1+UUufGfQ
	auca8Afk9VUfnH51Kc64YEx0Q==
X-Received: by 2002:a05:600c:a4f:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-48a7b543796mr66187605e9.23.1777458621928;
        Wed, 29 Apr 2026 03:30:21 -0700 (PDT)
Received: from localhost (p200300f65f114e08936c55da887fa426.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:936c:55da:887f:a426])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48a7c57b641sm47160965e9.6.2026.04.29.03.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:30:21 -0700 (PDT)
Date: Wed, 29 Apr 2026 12:30:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vincent Mailhol <mailhol@kernel.org>, 
	Krzysztof Halasa <khc@pm.waw.pl>, Johannes Berg <johannes@sipsolutions.net>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Steffen Klassert <klassert@kernel.org>, 
	David Dillow <dave@thedillows.org>, Ion Badulescu <ionut@badula.org>, 
	Mark Einon <mark.einon@gmail.com>, Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Manish Chopra <manishc@marvell.com>, Potnuri Bharat Teja <bharat@chelsio.com>, 
	Denis Kirjanov <kirjanov@gmail.com>, Jijie Shao <shaojijie@huawei.com>, 
	Jian Shen <shenjian15@huawei.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Fan Gong <gongfan1@huawei.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Mark Bloch <mbloch@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Yibo Dong <dong100@mucse.com>, Simon Horman <horms@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, Jiri Pirko <jiri@resnulli.us>, 
	Francois Romieu <romieu@fr.zoreil.com>, Daniele Venzano <venza@brownhat.org>, 
	Samuel Chessman <chessman@tux.org>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Kevin Curtis <kevin.curtis@farsite.co.uk>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Kees Cook <kees@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Thomas Fourier <fourier.thomas@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Kory Maincent <kory.maincent@bootlin.com>, Zilin Guan <zilin@seu.edu.cn>, 
	Marco Crivellari <marco.crivellari@suse.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Jacob Keller <jacob.e.keller@intel.com>, Philipp Stanner <phasta@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Yeounsu Moon <yyyynoom@gmail.com>, 
	Denis Benato <benato.denis96@gmail.com>, Yonglong Liu <liuyonglong@huawei.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Yicong Hui <yiconghui@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, MD Danish Anwar <danishanwar@ti.com>, 
	Nathan Chancellor <nathan@kernel.org>, Sai Krishna <saikrishnag@marvell.com>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Larysa Zaremba <larysa.zaremba@intel.com>, 
	Joe Damato <joe@dama.to>, Double Lo <double.lo@cypress.com>, 
	Colin Ian King <colin.i.king@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-parisc@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	linux-rdma@vger.kernel.org, oss-drivers@corigine.com, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH net-next] net: Consistently define pci_device_ids using
 named initializers
Message-ID: <afHdAUpvfYa7A3AE@monoceros>
References: <20260428171845.2288395-2-u.kleine-koenig@baylibre.com>
 <20260429-responsible-clever-coyote-6b79f1-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3grpbpcumi4i3vj3"
Content-Disposition: inline
In-Reply-To: <20260429-responsible-clever-coyote-6b79f1-mkl@pengutronix.de>


--3grpbpcumi4i3vj3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next] net: Consistently define pci_device_ids using
 named initializers
MIME-Version: 1.0

Hello Marc,

On Wed, Apr 29, 2026 at 11:10:21AM +0200, Marc Kleine-Budde wrote:
> On 28.04.2026 19:18:44, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> >  	},
> > -	{ 0,}
> > +	{ }
>=20
> Nitpick: can you convert the terminating entry to follow the same style
> as the rest of the driver:
>=20
> diff --git a/drivers/net/can/sja1000/plx_pci.c b/drivers/net/can/sja1000/=
plx_pci.c
> index a03553b80a5d..d69ff0ccfd94 100644
> --- a/drivers/net/can/sja1000/plx_pci.c
> +++ b/drivers/net/can/sja1000/plx_pci.c
> @@ -353,8 +353,8 @@ static const struct pci_device_id plx_pci_tbl[] =3D {
>                  PCI_DEVICE_SUB(ASEM_RAW_CAN_VENDOR_ID, ASEM_RAW_CAN_DEVI=
CE_ID,
>                                 ASEM_RAW_CAN_SUB_VENDOR_ID, ASEM_RAW_CAN_=
SUB_DEVICE_ID_BIS),
>                  .driver_data =3D (kernel_ulong_t)&plx_pci_card_info_asem=
_dual_can,
> -        },
> -        { }
> +        }, {
> +        }
>  };
>  MODULE_DEVICE_TABLE(pci, plx_pci_tbl);

That might be subjective. I also see some value to have the terminating
entry stand out a bit in the formatting and so I usually kept the entry
as it was.

If you prefer I can rework the can drivers at least to match your taste.

As you didn't object to have the can drivers converted as part of the
drivers/net patch, I assume that part is OK for you?!

Best regards
Uwe

--3grpbpcumi4i3vj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnx3bkACgkQj4D7WH0S
/k6JpggAqaPu+dVWg39EGo869zm4GExkyk9Cfi0y4X05WE8coeYG2q3U4oD1x05e
mbEJVHdpAHnBcB/vafRjFDSueFN1LbdYKyqmCOoSEVZm6FUryg3uez5LBTQ1H2M+
HSSsw95R2MJqtNxxGphk2Cr4lR3yVrG+oJpIot8CPMMed7xddK4yn7AdrudrcYAv
fhOuS+7KEB4g6yajDT95eF2Jj+hN7rzcU0+g6TBO5Gd3GnLwIhG6FG4iZnwnaU8Z
FqH+sC+KN85L/JYWezdPXgx5DnHkrmX1530hPFowO9u5SBLf6zBmbuKUgF8CdU4H
gSp6StxoogXj+z4H3WJRpNSbxjHwNQ==
=BqTG
-----END PGP SIGNATURE-----

--3grpbpcumi4i3vj3--
