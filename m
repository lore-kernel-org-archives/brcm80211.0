Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350A21A0728
	for <brcm80211@lists.linux.dev>; Fri,  4 Apr 2025 08:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756409; cv=none; b=KoFae4IGOv7G2iQ7llDGp16GmtpsEiyzYyWAzPdpvXMqYf+72yn7ShfUYif/e+TmaQL0c6sY+6NspotR/BMUfBGZjH5fPJbap09ZX8JVVH0pEGE12sOCRr7xOfrPzhfQLqG+ar9OIz53R9DeLYjzNr9ooe1eUx3E1Qi2RC0Dcew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756409; c=relaxed/simple;
	bh=E2lc2A+7vFvspOZs4wP9g6ue5EEm94LtW39cVKvUsXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFWN7V1EuPFEO+BYSSg6xxG2mQ1fjP0rukA5l2pEM8ya2htr+mBWNAViW/E/ikE0rFDq9glU9LU7YW81OtjwDAmvbpJZI3dV20mq78XnAWVwL4YbVoltdx3hS2iFamH3U5LydbDiGfqbOIZ3tUHOhAvLzHVmN63x/qyEmdrXedM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aoy//EmR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aoy//EmR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736b34a71a1so2193330b3a.0
        for <brcm80211@lists.linux.dev>; Fri, 04 Apr 2025 01:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743756407; x=1744361207; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XEr/lesTAhWcQcf7iA9OshZymqi1lesrw8RKfhNHVDw=;
        b=Aoy//EmRm8XJveeJXBG/NU23mftG8mDWm3SeaYAx9l7J/mkAc8K+eF529Ws2lW+8KD
         fUaak/+ywoOPj8ZuCvjimeSgYQ9CYiUrbx2appZKofPqNic6yiig/ZD7vvJL2uyySVRW
         /m1drW0ZUPyBKv5ThP8aOAFHjE1exTjJeHqd7kQrYmB6dqokngtnDlzPVzL3ZRn0gWsl
         CBYQwSGLNznSgSSkeXf6uCw6f3hPbN5BrTLBRy2BZ994N7ifQqAZqNRt9SjyFtRVEQrP
         Y4P9i3CQ8cjBdCshAbGrbZPBVY/i1fg4gKbGWn6e4cggY5t15HnqPvMwnFqlQFIakxcO
         hEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743756407; x=1744361207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEr/lesTAhWcQcf7iA9OshZymqi1lesrw8RKfhNHVDw=;
        b=m9wUupKcQ4ZTMpNGw5HXFSahYBtUEmAPYyMDSod2G7O+Y5IQxZWGua7CVaRxDWIN9M
         YRxYho3KMMOIeIMbBvKjLF8Q1BiLbP+1f7qwJFFsrFmf8rE1HwLDPLyX5EVS5HDXN9mh
         2nRLCDqIsJthFWWbMy5k06E8Uu0E5HXp64OmfxbkXNml7OQ+Ia1IzFD+puMHD+noB0Hb
         ZtwfjSirpYwBmMO+TuwAXMN0979S0vEH3vLaAqnpSMpMTV+XaN46kFH45CU4Dqx+rm66
         O3CEnfdcyfRORZmKVSUt+aW+JxJZWUu6e40QXIPtfSL4YpI3XN14GODz0Ji9GEgbmX7G
         AN9w==
X-Forwarded-Encrypted: i=1; AJvYcCV6aLXMC4vHKoiF9nsRTpF/yw46wEUkE0I6zNf8Ru5KaufJbylAoOD3l5uXRhtPO+13JZlPlCX7MWI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxH6EKxq1GeS+dK7zKRqIiJf7tRXBvJHHSEBEtPLA6FdoqZMyQ3
	F+ToAOaYR25YG5X/7ymMEBsuP2PDY/6JlwwOZazSnPqlYTx41pip
X-Gm-Gg: ASbGncsYQ7lraI86hV5hicWqnxMfJ9iXOxzk3diphtHaUXPH/clTKy4EJgTROug/6dT
	XnSAXQDI28/3dUmI/wNdatH5p3+04KAbCqfT6AUpiMc0rr1kS9a8bRobNb06QEQYtwZ97jzNcX/
	YvcI/8TGqrd6HLJyIh06oCmcSCMZu0IOrDV8CCncRL+PuvIVGo26NVpO9WkXqW3aF8rzxnw5TY0
	K6lb1JUACibneafQHCELXTop1AgdFWqWK09uyjgedDfDNt5HsoMSBsARLsG5c6oJee/JYWPQIh3
	3cXviDxbCsUs1LE8jU9/Rky0N1fq9E1xYktAN/2YEekORUMW7uEWVjI7pDckraDysNsRY1r1
X-Google-Smtp-Source: AGHT+IGnBuGwhOqlkhsoqT0zhJln64liGpkRA7l3PCCq0BqnYRQF3lpkwuYz5g4xSoDa+vLjvXq3Yw==
X-Received: by 2002:a05:6a21:483:b0:1fe:61a4:71d8 with SMTP id adf61e73a8af0-20104666844mr3980332637.22.1743756407334;
        Fri, 04 Apr 2025 01:46:47 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc34ec32sm2448099a12.35.2025.04.04.01.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:46:46 -0700 (PDT)
Date: Fri, 4 Apr 2025 16:46:37 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Yury Norov <yury.norov@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
	David Laight <david.laight.linux@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
	arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
	bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
	davem@davemloft.net, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	edumazet@google.com, eleanor15x@gmail.com,
	gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
	jernej.skrabec@gmail.com, jirislaby@kernel.org, joel@jms.id.au,
	johannes@sipsolutions.net, jonas@kwiboo.se, jserv@ccns.ncku.edu.tw,
	kuba@kernel.org, linux-fsi@lists.ozlabs.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux@rasmusvillemoes.dk, louis.peens@corigine.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
	neil.armstrong@linaro.org, netdev@vger.kernel.org,
	oss-drivers@corigine.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, rfoss@kernel.org,
	richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z++cbTTp8leOJ5O+@visitorckw-System-Product-Name>
References: <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
 <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
 <Z-6zzP2O-Q7zvTLt@thinkpad>
 <3ebd280e6697790da55f88a5e9e87b4cab407253.camel@ozlabs.org>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ebd280e6697790da55f88a5e9e87b4cab407253.camel@ozlabs.org>

Hi Jeremy,

On Fri, Apr 04, 2025 at 10:51:55AM +0800, Jeremy Kerr wrote:
> Hi Yuri & Kuan-Wei:
> 
> > Thank you for sharing your opinion on this fixed parity(). Your
> > arguments may or may not be important, depending on what existing
> > users actually need. Unfortunately, Kuan-Wei didn't collect
> > performance numbers and opinions from those proposed users.
> 
> For the fsi-i2c side: this isn't a performance-critical path, and any
> reasonable common approach would likely perform better that the current
> per-bit implementation.
> 
> Our common targets for this driver would be arm and powerpc64le. In case
> it's useful as a reference, using the kernel compilers I have to hand, a
> __builtin_parity() is a library call on the former, and a two-instruction
> sequence for the latter.
> 
Thanks for your feedback.

IIUC, from the fsi-i2c perspective, parity efficiency isn't a major
concern, but you still prefer optimizing with methods like
__builtin_parity(). I'm just unsure if this aligns with Yury's point
about needing "evidence that performance and/or code generation is
important here."

Regards,
Kuna-Wei
