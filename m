Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9CA20AF62
	for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740411362; cv=none; b=ZBZG5ZJ9EVYFkjq+7I7YjIy3uySGY4kveqbOu0c2N7n2uOj2IojzVUqSnIDDCEpxDypVLpWHZ8cDoGoR8OvceaNoxpEevV+MUgvO1s/0YgTXGFJ5r0JmqIKa2+PhFdOAr1i4U/C6pdvchHpKdEWheqJGJ6OxLgqaKJcoiGb0ZOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740411362; c=relaxed/simple;
	bh=f8eRj/AuYAHUZhC8jvYuxxDYnuW5TL83F7ZoXDKXJ9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfRo7rTec28h2SeL1u5kTkk34df6P9yKPNm44BEULT4PieIaI1K4+Wu7NGi25Y+YGMzBiXC1dELQ3LqrtpssTsNa+agw4rPwtmw+kRfG1FUZEZODX6K2GYtt6bGO7cQR16P2z6Sgoatiphk2VK+4kWtQr6wrhxz3b8IqLb596q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcklYHOP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcklYHOP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220ca204d04so72873155ad.0
        for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740411360; x=1741016160; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvUBzAQsQhizjRbALhklVYcHMIlUUFNb0lUUZGXIVX0=;
        b=ZcklYHOPPoUteubZ4JHz8vPKFXTE6Ehhle8pE5pL6ruQ7jxYjt9uFxj4vugRP2aouD
         aHNYemNzAluLFV2kJ/Eq4RvlNGK1AowOpADIJII8GePj0dnn91Fw1T5SVhuhuRyHfAqq
         HdQ4Ng1wky5r9av8kba6a/cGXoYyKxVR6W4i7wi7/uKhfajoONjcvW3Xtk3MWvsTWstl
         M2rThp9iUTVgYIGVZoTEJGkMjo1kdkqXgwYQvczmYgckxMW4XiSOBycUTf6AsHWZDxYr
         EZqa16T9oqpTRoNMVvnF4RcyhBAbljrEqNUobj7JTPVaTd2eiVt3nDFUZ/9R+Q9kog9P
         ikLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740411360; x=1741016160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvUBzAQsQhizjRbALhklVYcHMIlUUFNb0lUUZGXIVX0=;
        b=D81pAUC6ppviv3Hqqhh5bRf6o28T8/WgEDs7CGV1e8rjWpEJVO/UcY8CjEGAQdwN6P
         mKlpVUW2xCp1JUOSbf7NRc5PsmO3zvdPFUKLD5e+94Pec83ljCBfrY/fn8jClayk1RMk
         3sxcgHkOOYQiTZtiQtkjiPL7fvC2V8KD0cwZHZ7gZD8I6oEdhMyx4mLWnWWJhY4IRFvQ
         5rnZzC/mAxMrX6Tm+Y8sZBmmX16V5EbEtXPsQNZnUfuqGJlTarJB1QoB4gZSgdUiXSHf
         EVMa4z5HueGrruzpx4/N3xADLTVodvEjI1r6FMaj1Jz/FMsAEgFBSN8mJoyfxigWNTnp
         AydA==
X-Forwarded-Encrypted: i=1; AJvYcCXZqgphRUEo6WhUysn7g8xX7oGGFbyikNh344ONfdKBGqO/LZ9Xn+mSGV8+u/mp26qCCkpj7EH+ryo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXpX7eEO7vxaz+/D8aFkL0wrNopqCafzC/t4jVi+LbAZVA5x/U
	r6tciXO+DIfcn1Cd2RFVO2wzgl3YiHfGg3YPTbM8FV078BuxUZrm
X-Gm-Gg: ASbGncuVQS85ah3u8mAuwDeLO7X0Apl7Q2kB6vk+gg0Jgg0wJSoxjKdwrKNZR5ybNdR
	IqteVnFv0QsFG5r7J0OBdKi7ParrMK7g2lFEg8tQHpQmRJ17R1cDlLeIxBmH/VR6YnxtAFaHwMe
	f7nMycjeR3xTQXy+vhTjbCjWaegcQ5Vs3wTGmR0KdDT2z08S2v/N1gxw0myWCB1+WtLK74ArpNU
	wFbQc7/38jcWK9UGnQnXDQOsVvSDnA/iOZfg5zJw/4wWSD4X4BSeSP2po9tHzuEli2fvNWgtNtn
	mI1234tr+e7xYZPsVUvdeL/6a8sr
X-Google-Smtp-Source: AGHT+IHd2msCEkxFy+eTP0g8bXm0gN1PJPrXpracR00S9KkpiQvppU+iNHJWil/lk2n6JQBTakl5Tg==
X-Received: by 2002:a17:902:f706:b0:220:faa2:c917 with SMTP id d9443c01a7336-2219ffa74demr245408665ad.34.1740411359935;
        Mon, 24 Feb 2025 07:35:59 -0800 (PST)
Received: from eleanor-wkdl ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5348f29sm181794265ad.37.2025.02.24.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 07:35:59 -0800 (PST)
Date: Mon, 24 Feb 2025 23:35:48 +0800
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, joel@jms.id.au, eajames@linux.ibm.com,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, yury.norov@gmail.com,
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
Message-ID: <Z7yR1C4nC1UTrX5e@eleanor-wkdl>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <1cebfebb9c205a1ebc5722ca7e3b87339ceb3c79.camel@ozlabs.org>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cebfebb9c205a1ebc5722ca7e3b87339ceb3c79.camel@ozlabs.org>

On Mon, Feb 24, 2025 at 03:58:49PM +0800, Jeremy Kerr wrote:
> More so than __builtin_parity() ?
> 
> I'm all for reducing the duplication, but the compiler may well have a
> better parity approach than the xor-folding implementation here. Looks
> like we can get this to two instructions on powerpc64, for example.

Hi Jeremy,

Thank for your input. We will do that in V2.

Best regards,
Yu-Chun Lin
