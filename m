Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4EC40F8D8
	for <brcm80211@lists.linux.dev>; Thu, 30 Apr 2026 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554801; cv=none; b=oFrR6zlT1PQ57T/s5ZEX1gMVBwBvpq6bjkYLsWtp95aZ5lzGO/ldHw6o8xsDZSYPFi8SGFzrk7qMAt86iKaqjA34Z4Ghj/NghdR21OSCNH4AiKOCpAznxJZJRK7xRwL9oCILXE2SY1pS4xVlvVSO6RcTJ2+TqgLy3nsqPucUueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554801; c=relaxed/simple;
	bh=RE498i0yz6ZiBeXODxWPnDudcSJ72IIOpFS8OHOnbxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDOLV/TudBRhTnVJtAvNECpPbq4lXn5YlJ61J3M37xKBsTYhEtuNgoXnE+H1dJH3BaxrlTZRKZ/Yfv/JwHHAr1fY+LFyZ11B5qla7yCW34LKaXfx4N+yLoKoIGCvvSmVFR0dXTkawU6hTv58kSzxxDSGz+CzY11k9eCw4oPJsYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Ifkovqhd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Ifkovqhd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so7505795e9.0
        for <brcm80211@lists.linux.dev>; Thu, 30 Apr 2026 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777554796; x=1778159596; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FAU+laBnEtUtqsKtQVHrzB08mfX6f6gr6ykNiU5Tq5Q=;
        b=Ifkovqhdhxd0TK+6XhjiysBDjtaC+MOmWI/qPtn3lQHjhLrVGltLGCMLN108K7RX/r
         ihjcPk4okWh/ZWUigR3WpYL3PlzawSMZE+bbmClpvvAcBzfhi/01nN8i+qOdaImlroZk
         /X0czTSk+soHoDFLOJr1LqXyn/05/DMHGRJiWckU6IvBlCN0wgCu/y/xVsDU5VKLsU60
         XgdvrUJDy8ViF76grxuR8Dz72HusB8XqBNzGx8SPGWkYaKRaLZVuvRbbouIw3IYvniI7
         QH5Zh98p/JMfZzNBZI+WWrdbt8AfX6605z5zhfjSWFQZsw/dkpnTEbXZ0xPwhxsaH1Xn
         q8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554796; x=1778159596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAU+laBnEtUtqsKtQVHrzB08mfX6f6gr6ykNiU5Tq5Q=;
        b=CGa8BEZyxk7FH6od9pP5F9kDk8UUByLnX6fFvGzoWp1Q8WTo8A1Bzv2D0qNMwoMG5L
         7bRd/DCckE8TVWLB1QaVajcHsM80lAvUwF7FAv729Xedw7h/kzv6jIe7IJ+vXAJ5/Jkw
         yBjVQgQECRa22IQrmeI26x5AsKYAfXmKpa0DJyqeyjaBzdEl1PqPsuJNrdmb5UYR0ajx
         HaFVIMf236PaABCau/vSAGuIbS2MVYgftElgVSJM26FBJDGkcDrFJvUnCLXvjV4dNCg5
         fbxbmRjE/xh8R0wetfgjyZQmOdmQb+V4DOtSc5Bc/m0cFdLogJdhcy5wtovL4eRmlcAb
         xRSg==
X-Forwarded-Encrypted: i=1; AFNElJ9YBcJppnSkuwhf3WGG7qpJTXN2dd7rK+4+T2jHYrSrzmbNfno++rueu1wP/tzpmnlkf6mC4GeNjVc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDobCy7Ed/l2kLSxRr8ZI+sAqQciVrC8tCFVvUUiju80X/Xu6v
	0rS45geL8h4pumMDSabYwlYXZinmVSSELdVZ//aOUlbdZwdgzL0LsbzvEDMYYxHSEl4=
X-Gm-Gg: AeBDieumC10yKFRspkUHasnCS2z24PiZumJqJAmT6hcS37ac+QnkZ/Awrwb4mKpCbva
	aprouqgweVk8o+6FZrt71phxGw5GCFoaXzf07YojCTx/jVRhXfO2JahfTsTXLx6uyLOTEtblHUt
	/PIs/lzvBPaEfFQtNhvVxy+Nj4a53XyySRZs8+YkqvVVPALFs5jG5Ffd/hO8h3u/rNSCYL99zJ1
	FIP8uumXQ2x0S49y9EcsKg1NSfMhhQ2I4kqxwlekAoFy8oJeq+r2Ihi9El/OJSTa4royyHRFtIv
	EbpaCIt2EurMGA4fBCWKumMPoRbwu5Wf2UncMPHM9iEsJ2ZDftJsCh/CeDoZgk2cP5bo4+bx66e
	e0O8KFEliWCbYd6mYTz0zcvMKta3d0Xs0RnUiJiZXOuuDj0XE7Ac5jQ+T5MIZl4WEK/8pH75eUH
	HTPRVNOBiJPeItlK4uoUKhNvXFdikWrmaO8n15hOpPsCzkyGkDpkIIboBoVdlD4+Tn73+4vxokg
	8CXQB3H83DDz+aJM05hGLwbpg==
X-Received: by 2002:a05:600c:1382:b0:488:a977:8d6 with SMTP id 5b1f17b1804b1-48a84458db6mr47509015e9.19.1777554795369;
        Thu, 30 Apr 2026 06:13:15 -0700 (PDT)
Received: from localhost (p200300f65f114e0859f76ff87a50eb14.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:59f7:6ff8:7a50:eb14])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48a7b912ee3sm74461355e9.2.2026.04.30.06.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:13:14 -0700 (PDT)
Date: Thu, 30 Apr 2026 15:13:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jijie Shao <shaojijie@huawei.com>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Krzysztof Halasa <khc@pm.waw.pl>, 
	Johannes Berg <johannes@sipsolutions.net>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Steffen Klassert <klassert@kernel.org>, David Dillow <dave@thedillows.org>, 
	Ion Badulescu <ionut@badula.org>, Mark Einon <mark.einon@gmail.com>, 
	Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Manish Chopra <manishc@marvell.com>, Potnuri Bharat Teja <bharat@chelsio.com>, 
	Denis Kirjanov <kirjanov@gmail.com>, Jian Shen <shenjian15@huawei.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Fan Gong <gongfan1@huawei.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
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
Message-ID: <afNUNeIsN4MrjWN7@monoceros>
References: <20260428171845.2288395-2-u.kleine-koenig@baylibre.com>
 <814632c8-070b-4b21-adbb-5a01a62d52f2@huawei.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eswuwmcxtpmq7cnr"
Content-Disposition: inline
In-Reply-To: <814632c8-070b-4b21-adbb-5a01a62d52f2@huawei.com>


--eswuwmcxtpmq7cnr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next] net: Consistently define pci_device_ids using
 named initializers
MIME-Version: 1.0

Hello,

On Thu, Apr 30, 2026 at 02:53:29PM +0800, Jijie Shao wrote:
> on 2026/4/29 1:18, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > ... and PCI device helpers.
> >=20
> > The various struct pci_device_id arrays were initialized mostly by one
> > the PCI_DEVICE macros and then list expressions. The latter isn't easily
> > readable if you're not into PCI. Using named initializers is more
> > explicit and thus easier to parse.
> >=20
> > Also use PCI_DEVICE* helper macros to assign .vendor, .device,
> > .subvendor and .subdevice where appropriate and skip explicit
> > assignments of 0 (which the compiler takes care of).
> >=20
> > The secret plan is to make struct pci_device_id::driver_data an
> > anonymous union (similar to
> > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylib=
re.com/)
> > and that requires named initializers. But it's also a nice cleanup on
> > its own.
> >=20
> > This change doesn't introduce changes to the compiled pci_device_id
> > arrays. Tested on x86 and arm64.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
>=20
> ...
>=20
> > diff --git a/drivers/net/ethernet/hisilicon/hibmcge/hbg_main.c b/driver=
s/net/ethernet/hisilicon/hibmcge/hbg_main.c
> > index 068da2fd1fea..b3e01b2f8319 100644
> > --- a/drivers/net/ethernet/hisilicon/hibmcge/hbg_main.c
> > +++ b/drivers/net/ethernet/hisilicon/hibmcge/hbg_main.c
> > @@ -489,7 +489,7 @@ static void hbg_shutdown(struct pci_dev *pdev)
> >   }
> >   static const struct pci_device_id hbg_pci_tbl[] =3D {
> > -	{PCI_VDEVICE(HUAWEI, 0x3730), 0},
> > +	{ PCI_VDEVICE(HUAWEI, 0x3730) },
> >   	{ }
> >   };
>=20
> Reviewed-by: Jijie Shao <shaojijie@huawei.com>

Thanks.

> > +	{
> > +		PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_GE),
> > +		.driver_data =3D 0,
> > +	}, {
> > +		PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_25GE),
> > +		.driver_data =3D 0,
>=20
> Thanks for your work.
>=20
> If .driver_data =3D 0, is it possible to delete it to be consistent with =
other parts, for example:
>=20
> { PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_GE) }
>=20
> > +	}, {
> > +		PCI_VDEVICE(HUAWEI, HNAE3_DEV_ID_25GE_RDMA),
> > +		.driver_data =3D HNAE3_DEV_SUPPORT_ROCE_DCB_BITS,

However keeping the explicit .driver_data =3D 0 to have a contrast to
other `pci_device_id`s having a non-zero .driver_data in the same driver
is also a good reason to keep the (technically redundant) assignment.
For other drivers I dropped these assignments if this is possible for
all array members.

Having said that I don't intend to rework the patch for this suggestion.

Best regards
Uwe

--eswuwmcxtpmq7cnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnzVWYACgkQj4D7WH0S
/k6Htwf7BvJ3rYQezsd5ccz+2MAtba8pHTB3I6pUsnO2mYagJg6HKmfMspgye4AX
BO1wngPAitkKYC0Y1QVjeL8mZpJnkiTKh5ZpywnJ5LC1/Y46vbJl1a7z45/l4MF2
zOsQls/uPpw8h/Dif+kH4laLc33EYUiN6uoPtEBvyJuZUfEXWMc6KHtzmIZnagla
mZcae0icKZUF5MyFeux8zVGWeLTcdBYGrtWUJ2x68bnP62MozIOSPUXTFkPxWruD
HFTrL81mQYbLfZ88SKlMyogAeA7UjBd5/MpVdnfzLm1viy3XHq/Y9eIDkr/WypiX
51YxF/Ol5KsTDi2naPCCB1uZE9k0xQ==
=gn92
-----END PGP SIGNATURE-----

--eswuwmcxtpmq7cnr--
