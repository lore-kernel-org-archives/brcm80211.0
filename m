Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C201E1DD866
	for <brcm80211@lists.linux.dev>; Thu, 10 Apr 2025 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297655; cv=none; b=FPYzGx0e38Rfrn5ZlishaXZ6jc/GP3EGvQPNOVZ5B9vl+pe9aaR3oJjnYXlUg34RMS/an3PdIf4mHMjkR/wVzk76ahgm7SJIhrMcU3FwyhFq95ZEG6kko9i80RHYFqgaW5waE1Bp7FHc9TrLqb3yqR6Ul5GAYTA1AlbFLF0+iJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297655; c=relaxed/simple;
	bh=29zjlfK0mXnUdbnnsCXfS6Oi8Qrp5HNYmCj3Q7Up+6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFA8T5/E69kW2ox6TRFwZyRUP84kZPN1lVaB59MAnI4jQ2pRjrag3T/vyEpCa82OxjT1c1VYojosoK0TWZxB6FhZa+AQ/PDIXLHSjCRPQE0A5hIBaI/4Kn90cNLAZn6hjAjdD/p130JtWi7dentQLMFmZRoYNOHs9A13WxQjysc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxFcIWaX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxFcIWaX"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736b350a22cso800317b3a.1
        for <brcm80211@lists.linux.dev>; Thu, 10 Apr 2025 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744297653; x=1744902453; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3D5EegHjNXWtRqs7oVUZyDcWwG0k9rfQtFHn9dOK4Lo=;
        b=IxFcIWaXwP8my45rOIwOhq0bNFVDZ05tGYZcSGvcLE56p/shSONPGaHW4PRMXy1/0j
         QHYtNLlZSrABHrsBWVzax4cFPqqdmmhJnoxWNISdNbQD4fsXz7IjJshci6KIsn/JJvpH
         EaNzdzeesYkoDcB1MM6yke7G5/g/R9O00QZUKKWZ7PvXPSnd3L0h+bGlgcepuMwcNdT0
         a8qEMNWIkCrkQLToY5ZD1gU9HdE5VPSdLqLl1BPnsfwuSVnKsbs+xWaFku1m8dj3tQWc
         3PTttoj2oRFZDrw6v8CgDAfnCIoMyBV64+KWLh0ranaSS6AMgMwvnyvsDDB5yVFAo0HP
         /4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297653; x=1744902453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D5EegHjNXWtRqs7oVUZyDcWwG0k9rfQtFHn9dOK4Lo=;
        b=O8rIx7uP/oqNdk0ai3jmhCVRc6iCWL+Hed8f8hEirSoEaCX3YoJlaN7bmBYKZAwrlr
         c4iawb+jGVhJE031LX5a+Qxh3O9ZtNxLsBUBQESh42JynkjCMqNMOz0Bosl2Dkn+P3if
         01qsO3tdmKywVvF80KO5B8fa1NMaCN5lG8jkUGVNEoGvWFQUgkkGyRoVqL9Wt2zHPsaH
         94enNjYY5hBSfNd3MkKwLuWgAtT06m0QM46V3w8fBJi8CqG7gWvK2hjqqeojQAVXYBJh
         8aAdYMrMeetjwzK+JMye+6Kwk3N6Pqt7BAtyXAiD9e5mte75p7GqYdxPxmGwT16sqp+c
         r5tw==
X-Forwarded-Encrypted: i=1; AJvYcCXA3meaYCKcPIzxSiqKBWdq6BYA6iYPiPxoG1n5UOyRHfeyj+3/resqEWSztTWBDGzeCr6uIKDTmOs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHzJ4WFhBaezoB0u8KfgqKX289gL3tYV8Pa3jRo7MeoxOlW32K
	DMvRzJNP3iYpI1wYEMCrDTBVHsUTxEW1Tv+8ii48BDHfdp/tV3IZ
X-Gm-Gg: ASbGncuU8ywmrZlNQDFJ3lpkciIA6ALH0bXu+18DQ5SX/Xve/w5Lokdjxh/gyilDkER
	yD6YYyqfY5suplEbom/WaN2pDW+Ua9QKPDYBOGTS8v1V+MzNiRfK3KBXlW279w3N+dcn2MO+IMb
	NL8vHeNQPHdv4UjYwZUqukhsDpwfMIPdEdUctISTb1D01PLF6FbL+uUQinbPGDLGNX0QtX6z3wF
	YdVEv9FsDCQSSn91bRZXF6brlAbwpWhEPCLCdWsQPKv7KfhbGuwmkO0tSfNOG08Q0Gp9obPfa4q
	9JzesVfFLgpE5vIhs2qYrgzxJtHpFGPe7XuNRxCU
X-Google-Smtp-Source: AGHT+IFy1ewRYIQi2QM4ZSLkQhokapTj0gR7Ltj5GpPkDsZlOlyCTjP19Ec1IKFhcZrwo1l74Iw4rg==
X-Received: by 2002:a05:6a00:240a:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-73bbec49f99mr4365817b3a.0.1744297652831;
        Thu, 10 Apr 2025 08:07:32 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e51f1csm3501019b3a.145.2025.04.10.08.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 08:07:31 -0700 (PDT)
Date: Thu, 10 Apr 2025 11:07:29 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z_fesYbCnSjAo-K4@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
 <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
 <Z_a_PzmNnvC2z7se@yury>
 <Z/bC6cygo0hem5IO@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/bC6cygo0hem5IO@visitorckw-System-Product-Name>

On Thu, Apr 10, 2025 at 02:56:41AM +0800, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 02:41:03PM -0400, Yury Norov wrote:
> > On Thu, Apr 10, 2025 at 02:23:09AM +0800, Kuan-Wei Chiu wrote:
> > > On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> > > > On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:

> > > > So, if val == 0 than parity_odd(val) is also 0, and this can be
> > > > simplified just to:
> > > >         return parity(val) ? 0 : 0x80;
> > > > Or I miss something?
> > > >
> > > If val == 0x01, the return value of calc_parity() will remain 0x01.
> > > If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
> > > be changed to 0x00.
> > 
> > Sorry, I meant
> >         return val ? 0 : 0x80;
> > 
> > This 'val | (parity_odd(val)' is only false when val == 0, right?
> > When val != 0, compiler will return true immediately, not even calling
> > parity().
> >
> I'm still confused.
> 
> Maybe you're interpreting the code as:
> 
> 	(val | parity(val)) ? 0 : 0x80
> 
> But what we're trying to do is:
> 
> 	val | (parity(val) ? 0 : 0x80)
> 
> So, for example, if val == 0x06, the return value will be 0x86.
> Only returning 0 or 0x80 seems wrong to me.
> Or did I misunderstand something?

I misread the whole construction. Sorry, you're right. Scratch this.
