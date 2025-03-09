Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4130F8836
	for <brcm80211@lists.linux.dev>; Sun,  9 Mar 2025 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741535318; cv=none; b=OSO4B7JqoH6ABVFBNw2fOqAK/gn7E3D7HQGTY6F4RtXrITF0uowFkFMvKUUJtHD5AjNUUWuLXWuW/VUTe/ZcYIjDljkjK+e5EuFsMQHGP2t902tv8Izlg3K5BQOIoOqkQBvvh+JvjaXNRl5FHs4wRBohqV5VyHezL4qH1/l9Mwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741535318; c=relaxed/simple;
	bh=MZaV5bFfAdIoZnKuA7bGyEoUvV44zXeyNZF1dEi9Wnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Afl7PP/hCpyWrJgbFMT/jI6XnAU8QLUW7F2KRxQdtkQNlQmuL0uv4z0UeHsNj7XltLH+t9/jKtqqpyMMWnwk02pIXDaOVZ1kPhlb1/6WPLVKSdQbTPg+HeX08FZxRYyHmrvLPssAO1kfC4EceIaaWYziiGLqFl3gfrqRgYDzWYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxl01pbN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxl01pbN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2254e0b4b79so22453535ad.2
        for <brcm80211@lists.linux.dev>; Sun, 09 Mar 2025 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741535316; x=1742140116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgWYE3yJh/lyMxOG1Kh3pm47EvZJ8tal8TpSNO72h98=;
        b=hxl01pbNUfuTWjIFeWcV192kjJHpFFQoRvnrDJxmXvD7WqcIghUpqD70JszMt2RqJs
         QmAItfsjJRdDBWoGNojbR/iO/qRTUpUQhxXZSElP1VjYdx3m9TaZ8CRYWNtmlNzMOWFM
         oSFqYUkwX4DDGloMZY8ne1symGI1yxTzFqA607lUjnSCNdNZPDO0bteN+awHkligbD5d
         Zi4NhuAibwtFZvxIzM1aShAJ7cndMzUOsQmkVy9y8DMk5M+Z7M29k90gTgjYOVDN81lp
         BHo/ErxTc/LVE8QlFhuF/JwyGesb0Xr2E/2HbNZrgTLPDJRdjp1v9mV5a4Co18ulLzYd
         kASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741535316; x=1742140116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgWYE3yJh/lyMxOG1Kh3pm47EvZJ8tal8TpSNO72h98=;
        b=Qt/dJ1Z2yaqp69F+4WjiHsrenDwJ+W0s47bTBZ97SbV6dnOCtF9VsRiQ+3VrsngYNh
         8+Qc2sVkCnVUv5LphGoSMAu0CD3CYL69NT1qzpslpjWwT8pIhwRyj4A4RmKImOPJPmGT
         8A4rTaRQ/9S/4GcFrhO0riB2hXknIYFncd/rcx1sIhf6NbOVtO66ei7Bm2JmiXqUdogr
         vqgwZ7UqRIYlEFRQW1Wj8SJVrVETrByRfdTBxOu2sKbvJJD68Pi4Go03EeswM5HfJEeE
         O7qkB1Gc9rlIiTLIBwWqcLOixGMM3WVuY0JCZxNoaTz3HCEMckZkkoM5vLQby0Pi6HXM
         w3kg==
X-Forwarded-Encrypted: i=1; AJvYcCXWPl6nMtw+p0hQXGj7vXod5NGDZxA+VLLvzCdoAmXg2G+pcj1uVRgPpoJ+YA4yOC46TsgeN52rF7c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcnyma+4Iy3Oyc0IK2j1JGh2Ua8EarpSrKcuBkSu7rH1lueDaM
	JtHtRb0w+kUHvHDwQLcsjeLjimCe3ePey06l5w4YOJVurnsEPrF955C71oAP
X-Gm-Gg: ASbGnctoXBO5nz9jBUIfogJTGLgiQwePfmo3seYjBSQBmGjbgBCibP8d7p0HC+lYgo5
	dUrh4qSnb7xN9mx0o27ac7DxhG1cYHb6ODpmfnH6sRyXT6DbWe7006jZ7Kw+GLztBPTDkIdwdmq
	//QTgrfvWdEx4gBwgwphnyzpHAb0TgH691bk4ki0JrWkgEHUKEpqP8DySEEAyAB73oy7+DPOpKA
	uZlP0xDRv8YYPTaBGcY/xu2O338NoBfrO36h6umA3umnyTYCSuShMIW4/AE3exuRBI8svwNHt/Z
	9qAwtEAPi+Sx5NXPqTswVpR6yxzclZK/1h1UcHydJHYEGAGCLSTW2MaV6CVOZmOQFh+YxYZs
X-Google-Smtp-Source: AGHT+IEkPjdlZsP28acQWQx0Qye7i9usm3kNOW0i6DfYwW0Xas+u0oor8hXm2eg176ewgjMSRnRBqg==
X-Received: by 2002:a05:6a20:4328:b0:1f3:4661:d19e with SMTP id adf61e73a8af0-1f544acd6ffmr16482561637.9.1741535316400;
        Sun, 09 Mar 2025 08:48:36 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af2894e3cdasm5384249a12.24.2025.03.09.08.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 08:48:35 -0700 (PDT)
Date: Sun, 9 Mar 2025 23:48:26 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: David Laight <david.laight.linux@gmail.com>,
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
	jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
	jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
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
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org,
	yury.norov@gmail.com
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>

On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
> On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
> >On Fri, 07 Mar 2025 11:30:35 -0800
> >"H. Peter Anvin" <hpa@zytor.com> wrote:
> >
> >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> >> (int)true most definitely is guaranteed to be 1.  
> >> >
> >> >That's not technically correct any more.
> >> >
> >> >GCC has introduced hardened bools that intentionally have bit patterns
> >> >other than 0 and 1.
> >> >
> >> >https://gcc.gnu.org/gcc-14/changes.html
> >> >
> >> >~Andrew  
> >> 
> >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> >> for compiler-generated conversations that's still a given, or the manager isn't C
> >> or anything even remotely like it.
> >> 
> >
> >The whole idea of 'bool' is pretty much broken by design.
> >The underlying problem is that values other than 'true' and 'false' can
> >always get into 'bool' variables.
> >
> >Once that has happened it is all fubar.
> >
> >Trying to sanitise a value with (say):
> >int f(bool v)
> >{
> >	return (int)v & 1;
> >}    
> >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
> >
> >I really don't see how using (say) 0xaa and 0x55 helps.
> >What happens if the value is wrong? a trap or exception?, good luck recovering
> >from that.
> >
> >	David
> 
> Did you just discover GIGO?

Thanks for all the suggestions.

I don't have a strong opinion on the naming or return type. I'm still a
bit confused about whether I can assume that casting bool to int always
results in 0 or 1.

If that's the case, since most people prefer bool over int as the
return type and some are against introducing u1, my current plan is to
use the following in the next version:

bool parity_odd(u64 val);

This keeps the bool return type, renames the function for better
clarity, and avoids extra maintenance burden by having just one
function.

If I can't assume that casting bool to int always results in 0 or 1,
would it be acceptable to keep the return type as int?

Would this work for everyone?

Regards,
Kuan-Wei
