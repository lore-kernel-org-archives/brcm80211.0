Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C207FBAC
	for <brcm80211@lists.linux.dev>; Mon,  3 Mar 2025 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005694; cv=none; b=H5RzNSQ2EdBf/hB0Kdng1X4Ugd1Gv5RRk9IRPAtE/FvXNudjyiSbswRIOZ6tODUvtJ3X2lAo3jpVs+mSlpgDS0685jJeqHUIdRlLih7ANj7vjKnZnedE91d+pnmJlKf3jG/JXxvwghlG3oQf6iEiP32WLdPfkHKAPYwenKzkSH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005694; c=relaxed/simple;
	bh=tieKiWfa1sevnfvQv3qDEqr93B2c4NJALDpA5GWbCFY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I9tw+JZF2rscdkWaVqj47IzotWLifJ5COseuJi0T2opfmhcM3jYrSjr16GW6NQbkBSl3rHxt4xyU3EMLYYzO6LJQ+P7Y8ahqqKSYuLnGvFOHxvFmqqfGeHYsL9RtLjIky4+/X0lwvAdr/EbBQn5vvF6DY0WToKUna7HiBjts2kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8cQmlmx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8cQmlmx"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e55ec94962so1065781a12.3
        for <brcm80211@lists.linux.dev>; Mon, 03 Mar 2025 04:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741005691; x=1741610491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLW0AYaLwkO6JC1piDU5qS15yDYOQslsP1SvNrbEZfE=;
        b=X8cQmlmx/LykVhXn8zjvajMh6AwGN1fhKK1Rgo1TJOHhbS4I9UjSn7JfDKTiSPAabg
         LGXl9eD8MQTumiXyZDFzzP8MhqBkHIkAixilfwYHAvRg+HjjP/Vd2TNTpwhVX/nl/08z
         HVl25IjLRbg/KBS4MXZ7jJ4JcvwnNbSw+E50SF8zM34kKCCsLMAQEDAvxY77IV1kFFK9
         cCFfrtgOeTynI/uJlm7J/avZoy64QoSMHqbXtTtitT67DEocyjtK4oZXixQ3HGi0/Lna
         /gh0LlRDKSeug8L6L6p2qZhI2D56NV4ldRoEpRG1Ap0H9oGFWN0C198YPUYfE/XBz8F4
         tztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741005691; x=1741610491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLW0AYaLwkO6JC1piDU5qS15yDYOQslsP1SvNrbEZfE=;
        b=J6lu/DAu7yu5BXYtJ1OuOo1+ZQfklWujIvVBnyqFVGHpYmo/EUDPaw/UhX+zDuovxr
         VF2HTl8PegBL2Uf+NOgmBzMw3H8Lp/1SOnwNJKlCFTPoxuvaeMVCUYT9znscS+u0etGv
         kN73nSAnT4jM8M+SkhnVoq6eYbGJAfKHMArwEqUqIoUa4frFEVwLdJ2x+P0zrBSHodNI
         2ocJSV3vtcPlf7S+RMKqXGMI3GIxYUDRSSi/uXoYhVnMWJphQXCmbRUMWk5dOZDGuIH7
         /budt/G4BtG8J/Cv+G8u0BQeSnGRd8DgyXVHoldhsmVWD+TT0i8eb5QfBs/KNI3I5mbp
         t70g==
X-Forwarded-Encrypted: i=1; AJvYcCXS4KeigWGhNrCaZQpsTO+z7Ye9Zqc2LAdRaIqFrfutmkD4uuQi+AY2lrNNZ2aP/WtrZTbu48OCgws=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaiKN8mDp3R6T8OLLh1aePlaP6kc69U5HwwEAvFwaES/juCf8e
	LDLPsD++GRLbUYYUidNcKE/stZrv8pjq63jfpclc4/160qFC4JT6
X-Gm-Gg: ASbGnct9N995zdVc/CJMC/WnoLC3PBtCifm1jg4K+8tKlS05pBT50SJKVcgdj9v/frD
	pgADeqbk5mo9YkXh5iAO7Obm7O//hhPsTaDMAyr9RQoiTP1dmZ1qEvOTIu64fzN5PFVHg9srWYf
	4KlKI/WkAQnNkgSPZb3PhesmUYdbuht/4yZ514yB+8QLzTcWUWAQhuwD2x4UYdlgqw6VuVLLMLb
	nHqSWvzevnAsnL3JBF7qPy6kH0W9DrEe0ZNnVPxk2dAwp1Lhe/fbf2xrPMi9tyrJgUJG18G5SYp
	jtLmaxMMNXYM7Vx0CC2YsmImx+ZlXbhRHsWhOs3UgPuii0lb0MgZGwj1jXQNLJ02IdDbUetcUmj
	mQ/whZIM=
X-Google-Smtp-Source: AGHT+IGmsdmZpDuU64/zBFVRQ3e/o9vGnleqAFoX6F+q7Lw2p71TWS5SPeiWtsRpxGv/SLlt+kfa+w==
X-Received: by 2002:a05:6402:2808:b0:5e4:d2d4:b4f3 with SMTP id 4fb4d7f45d1cf-5e4d6af1582mr13492784a12.14.1741005688031;
        Mon, 03 Mar 2025 04:41:28 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb4384sm6903702a12.49.2025.03.03.04.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 04:41:27 -0800 (PST)
Date: Mon, 3 Mar 2025 12:41:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <20250303124125.4975afdc@pumpkin>
In-Reply-To: <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
	<20250301142409.2513835-2-visitorckw@gmail.com>
	<Z8PMHLYHOkCZJpOh@thinkpad>
	<Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
	<Z8SBBM_81wyHfvC0@thinkpad>
	<Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
	<20250302190954.2d7e068f@pumpkin>
	<Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Mar 2025 10:47:20 +0800
Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> On Sun, Mar 02, 2025 at 07:09:54PM +0000, David Laight wrote:
> > On Mon, 3 Mar 2025 01:29:19 +0800
> > Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >   
> > > Hi Yury,
> > > 
...
> > > #define parity(val)					\
> > > ({							\
> > > 	__auto_type __v = (val);			\
> > > 	bool __ret;					\
> > > 	switch (BITS_PER_TYPE(val)) {			\
> > > 	case 64:					\
> > > 		__v ^= __v >> 16 >> 16;			\
> > > 		fallthrough;				\
> > > 	case 32:					\
> > > 		__v ^= __v >> 16;			\
> > > 		fallthrough;				\
> > > 	case 16:					\
> > > 		__v ^= __v >> 8;			\
> > > 		fallthrough;				\
> > > 	case 8:						\
> > > 		__v ^= __v >> 4;			\
> > > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > 		break;					\
> > > 	default:					\
> > > 		BUILD_BUG();				\
> > > 	}						\
> > > 	__ret;						\
> > > })  
> > 
> > I'm seeing double-register shifts for 64bit values on 32bit systems.
> > And gcc is doing 64bit double-register maths all the way down.
> > 
> > That is fixed by changing the top of the define to
> > #define parity(val)					\
> > ({							\
> > 	unsigned int __v = (val);			\
> > 	bool __ret;					\
> > 	switch (BITS_PER_TYPE(val)) {			\
> > 	case 64:					\
> > 		__v ^= val >> 16 >> 16;			\
> > 		fallthrough;				\
> > 
> > But it's need changing to only expand 'val' once.
> > Perhaps:
> > 	auto_type _val = (val);
> > 	u32 __ret = val;
> > and (mostly) s/__v/__ret/g
> >  
> I'm happy to make this change, though I'm a bit confused about how much
> we care about the code generated by gcc. So this is the macro expected
> in v3:

There is 'good', 'bad' and 'ugly' - it was in the 'bad' to 'ugly' area.

> 
> #define parity(val)					\
> ({							\
> 	__auto_type __v = (val);			\
> 	u32 __ret = val;				\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
>                 __ret ^= __v >> 16 >> 16;		\
> 		fallthrough;				\
> 	case 32:					\
> 		__ret ^= __ret >> 16;			\
> 		fallthrough;				\
> 	case 16:					\
> 		__ret ^= __ret >> 8;			\
> 		fallthrough;				\
> 	case 8:						\
> 		__ret ^= __ret >> 4;			\
> 		__ret = (0x6996 >> (__ret & 0xf)) & 1;	\
> 		break;					\
> 	default:					\
> 		BUILD_BUG();				\
> 	}						\
> 	__ret;						\
> })

That looks like it will avoid double-register shifts on 32bit archs.
arm64 can do slightly better (a couple of instructions) because of its
barrel shifter.
x86 can do a lot better because of the cpu 'parity' flag.
But maybe it is never used anywhere that really matters.

	David


