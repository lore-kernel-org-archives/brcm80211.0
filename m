Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DC524FC03
	for <brcm80211@lists.linux.dev>; Fri,  7 Mar 2025 19:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741376211; cv=none; b=dcobqBvndRHLJCVNPGwxuWAqW/bXaDqqkQFC1wZI3vUXULYeo/2+6KH5Qv6xalfmEQbVPc9thVqygbwZ0RbMhDN1gXhcvQ3cneqCSOEdQI4KVAr1RBjf1/Ghq43w3lAXLSWYhD3jv9ko0R/JCEpxaMmf5lPl6x1iUzwC9MG6FlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741376211; c=relaxed/simple;
	bh=03HRd51TAJtBdjj5CN0yBCInrok2ztkJLZtRA9+zaFo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q3t4oloCywgMXfwaZDJbI5r4E+I+wM+4zCPZvo5sy3a1LCif363bKPDS7BuTGPYXBj9k9i2AVV8BtdLZ56iQgRAvRXP3MAHunVfDT9CN4si9Ky6pi2wkZakO6S3Dxm/Z0udz0D1Da2CgkvgNgR+J6LUJhkvIVrnSgZu8fyvvTYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5omoPMp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5omoPMp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bc38bb6baso13485095e9.3
        for <brcm80211@lists.linux.dev>; Fri, 07 Mar 2025 11:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741376208; x=1741981008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFoJyn4DTa2CPJIrOrIuaVtmodM0qzkMs+rPvEMHc5M=;
        b=j5omoPMpG6LYvbL14RoGNURfkYTjyzJJFgo1IwGwEnVDeyw+t153Dfgymrumnf98Rg
         NuMOzUGZeE8E20b4F1RMLL8avDbKWlorVPhUTQ0UCCvpTTbR6dj35YbNQWeyX5YpACkr
         AoVM57eV9HDLY3Rkus+nYY0G0SMGVi1CrIooHHkgEaGWgLm/lRQvBDd8qK1diJCq3QaH
         Xod0ZZMPMTyR12xEJCdGESnsfUs+/kLJL00irS94MpSa/A9iJQrbZrJOuMhafRmjBt4T
         ZhlNpHcLTk13MBROfwFFr12gA8v5+EOX3fzKHbdaZPvMVcoD4luT7dxB6tSr9nH19TS1
         57Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741376208; x=1741981008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFoJyn4DTa2CPJIrOrIuaVtmodM0qzkMs+rPvEMHc5M=;
        b=pGkdCGDfDQt7fBZtTN9U3LD3nMGsVNkSzFtEE2Ho7jKowFhoHqb1yE/RwjqK1eb881
         grMvGW+cmdDbbMbFkln+b/5I2aZ63KrV7tceN+wC4LJfFjtEJy12aw8Hs3PvmKP02cQv
         O6RISgQujRMlfIH6JZuva5FTCRJQJKjlw+ENVotuvcjDHeRFQWaiag8kGFXVLmHzs+sm
         m4PRaV9NsHQ18M0CaZuY0dUJ5WS1RknZYwIWbq4sw9mn7OUclOU55Uj9mUA2c29cf28l
         uQmBdxr1ovseGJABEV2atuZWBh8VJtwF/0dDJbePNJvpU7sHWgi6Klm5zPcYIV8RVNCL
         1i7w==
X-Forwarded-Encrypted: i=1; AJvYcCXXvYyztqjW4DjRTwdSxr1PJmJgK3srFO9tESeGYrAK5bNed/6k0LBet33Xv9sEmcES2aiD4HcNxoc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTCEkn2pJLtsBTuvKp6u8jFYwQQ49HJE1webk4RTn1joN3CrFY
	AqAPtBNAB83VysNsZiyYWiq23HFNKbgioB24Q9s8Ppfi9oUYi+jb
X-Gm-Gg: ASbGncv2jvXxlCqHEcoo8jdL3RLmbon47rUp9Jf65mVcd41Lv6FM4GAgrYHKC62qkVG
	bd1Bt2Om3ahagzJvfzZeY24cAwSPFH0R4U17MVT/FBLItlAw4exctdpyOeqhitaDC7b8OIIKaPE
	IebogqjoHUwTFJuJJuMHGHv494b8N6nSlPrjHwRn4/5NZ/2FXXrvJC1i3309+kqNOBg297KtMa6
	iTAGP3pzWJEBMLsVqKSoOEPRFV8hPAyEQwWG6jov0EGL2fvGPbSyExAmDWeE1iRlDX731AfJiWs
	txnzpVR0J/gjIFtbOa45D5y10wRvhmQIsARgDbBJ7qo1TZx2HgpR0tqSZcKM4KSFEaWPNA/V/CG
	53VPHCos=
X-Google-Smtp-Source: AGHT+IGYxYOhWA1l6Gh+krzanMxcdhuAnlJytBsEAg4OGnrOW8+O9FUNnMqzwJ9p5yYRvsqSKnj7Zw==
X-Received: by 2002:a05:600c:3007:b0:43b:c034:57b1 with SMTP id 5b1f17b1804b1-43c6024be64mr30043695e9.20.1741376208006;
        Fri, 07 Mar 2025 11:36:48 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c1030cfsm6392462f8f.90.2025.03.07.11.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 11:36:47 -0800 (PST)
Date: Fri, 7 Mar 2025 19:36:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <20250307193643.28065d2d@pumpkin>
In-Reply-To: <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
	<20250306162541.2633025-2-visitorckw@gmail.com>
	<9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
	<Z8ra0s9uRoS35brb@gmail.com>
	<a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Mar 2025 12:42:41 +0100
Jiri Slaby <jirislaby@kernel.org> wrote:

> On 07. 03. 25, 12:38, Ingo Molnar wrote:
> > 
> > * Jiri Slaby <jirislaby@kernel.org> wrote:
> >   
> >> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:  
> >>> Change return type to bool for better clarity. Update the kernel doc
> >>> comment accordingly, including fixing "@value" to "@val" and adjusting
> >>> examples. Also mark the function with __attribute_const__ to allow
> >>> potential compiler optimizations.
> >>>
> >>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >>> ---
> >>>    include/linux/bitops.h | 10 +++++-----
> >>>    1 file changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> >>> index c1cb53cf2f0f..44e5765b8bec 100644
> >>> --- a/include/linux/bitops.h
> >>> +++ b/include/linux/bitops.h
> >>> @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
> >>>    /**
> >>>     * parity8 - get the parity of an u8 value
> >>> - * @value: the value to be examined
> >>> + * @val: the value to be examined
> >>>     *
> >>>     * Determine the parity of the u8 argument.
> >>>     *
> >>>     * Returns:
> >>> - * 0 for even parity, 1 for odd parity
> >>> + * false for even parity, true for odd parity  
> >>
> >> This occurs somehow inverted to me. When something is in parity means that
> >> it has equal number of 1s and 0s. I.e. return true for even distribution.
> >> Dunno what others think? Or perhaps this should be dubbed odd_parity() when
> >> bool is returned? Then you'd return true for odd.  
> > 
> > OTOH:
> > 
> >   - '0' is an even number and is returned for even parity,
> >   - '1' is an odd  number and is returned for odd  parity.  
> 
> Yes, that used to make sense for me. For bool/true/false, it no longer 
> does. But as I wrote, it might be only me...

No me as well, I've made the same comment before.
When reading code I don't want to have to look up a function definition.
There is even scope for having parity_odd() and parity_even().
And, with the version that shifts a constant right you want to invert
the constant!

	David




