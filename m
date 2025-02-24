Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3CA207653
	for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740436213; cv=none; b=arlFva/6ng8L/tUq6ydZjgFZlnV3rW6Jg4QIOc8ubopPbWokiHXdXDLkTj1mL0vX44x6bW/Fa7Cy0qcHuT/2FrWCmDBm3L5X7Yq7y9zG5Q1fTn9K8eqSORDAnBgBvn3wNh42iT9zP7qzr8ZssIsLnP3aOvK7PbEliQYRZdHbRPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740436213; c=relaxed/simple;
	bh=EBRZfjLcwg5g2rsoSMmRqbsYdSeJMfXkKTCLAauJNJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXlYo+3VWnHp4HWfSDQhlhIgd7PfdsCKOqixHwW/J6BG6P4AHLeq70zzDV4vVUrO81I7knsdtokh5ZG3+PnvcoYiYq6T28k3pgMl0uquzYxbP8LD9oNVIcoH0GF+rRP8CsdKRnZhmQWGzr+J479MAHK/e83mSdbDY19a9eLu+dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFLrLmwt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFLrLmwt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-221057b6ac4so94833775ad.2
        for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 14:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740436211; x=1741041011; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Me2tClMPt10g2IbqRw63NkEwXox0kTNxKyczDkCN+Y=;
        b=HFLrLmwtqtrjRiUjyS/W31OqPVXtdImGZoxV9rdA8xTWq36FcEWaPWUrNdHqbwax8J
         n01+0IYYCUhyIcGJfMIWtMkEiKIxnmLx2LUrXOSSZaiZgmvimHea6NDjxp9p/fOfa9IN
         Kie+8B0c6HwxvMD2TAckf+iPYAS9XlhjmLwNoRm1dTREjNFddeTzKWdBWPrQjOM9AgBl
         VQhcQaSJgtXFQKa9SiVbby2WVIzKqIIx8BYM18gxYNeWfWKlpgqdo+++i5HD6hzJPMCR
         JFXjreWdwCQjR+OU8kOBFjuydYy8Uj0t7dLtWAtfBZymoxHxDy7U/LuHOmvqoHH8FYVf
         E5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740436211; x=1741041011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Me2tClMPt10g2IbqRw63NkEwXox0kTNxKyczDkCN+Y=;
        b=itPFguFfYNj2SR8FA3TQecUxQul8dl1U4n7edQKVO5TbgXD4el30GaQZ/acDTCwMjT
         ri39u9tp/AAbwDDwHhT6nQQ5n8tYA0TWJuEE3Kylvu4UmwW7DEMeCQoGNh6yN7fTwezJ
         5l0CHgNbXx6Eqb53dOlGJr7jQoPJyEZdgtlHqVcHYZMqyvhNnSfEyBy5ofT4H5qiJDcI
         /BCfGpvsS2FeDWSSewO4S/uRNAz2FXxGy5f6yzhfaSit7ojGEUVmOky8KDw4nY0WoCK6
         rMhZ3u0FKFad8qN2FPYvTV/7oLFxZ7zQ4W3jEAEe0sANop0oGGwSqp6nbRgIW4macBl7
         sOnA==
X-Forwarded-Encrypted: i=1; AJvYcCWSgzyk0ubFNnUxmLp4Ak1YAc1NpsdKy0ZKmjsishB/tU9DmD+5x0G+aFkFZwCisD8W+aGsiQbnX8E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+O4Y8jYnInffBJBT7adW6XaZuXi3Cc65PLqB18aPla2cf/nZg
	4o9twlZLSFAc+b1M22AQORQLjygApHkGSjhIhcRfhzTTE9goU+w1
X-Gm-Gg: ASbGncs9/PZLsvUOCf0QhbTXDr9VD46X45rZToiPfZ8Fa79nu3jrAeDZNtgmRG5Arkq
	ZsX1l1eBcwVxlSGkgdiyGL/Aje61f+r2nx5G4f19Wv1qG5p5J6xUKqrHOkgAOZBpfHzGjISm2Dk
	HrJUojn/ITTHVuDoEYRcYucXDZxUay4lXKeVSfGDKwbQ0SS2M8LQA/YzzH+YQvHwa8VkU9kpZYn
	2z50KIf35dxcY4+xAcKlTekFeo+/wA0a9vcemhW4g3sW1DshVlhU6bvU1kLmV02MYuE8/Z14UwK
	VVAnKWZ16KC/mDQV7/ZDdVK0eem+aZdXGe67EKA3p0Ks43oWxA==
X-Google-Smtp-Source: AGHT+IHSWZzc6ZuJ7NuejlOnvhXRMbFaz5+ejvmVe/JbcFGg9XTfI3FePFDJqFfvVera5WJ+OS97IQ==
X-Received: by 2002:a17:902:e542:b0:220:ff3f:6cc0 with SMTP id d9443c01a7336-221a1191974mr248692865ad.38.1740436210908;
        Mon, 24 Feb 2025 14:30:10 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a092fc9sm1130585ad.126.2025.02.24.14.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 14:30:10 -0800 (PST)
Date: Mon, 24 Feb 2025 17:30:08 -0500
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
	tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
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
	jirislaby@kernel.org, akpm@linux-foundation.org, mingo@kernel.org,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
Message-ID: <Z7zy8AOpAo4JQu8W@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
 <Z7zv-c4A76jeMAKf@thinkpad>
 <68F1ED19-B0C2-4E78-B504-2F7C040ACC0A@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68F1ED19-B0C2-4E78-B504-2F7C040ACC0A@zytor.com>

On Mon, Feb 24, 2025 at 02:21:13PM -0800, H. Peter Anvin wrote:
> On February 24, 2025 2:17:29 PM PST, Yury Norov <yury.norov@gmail.com> wrote:
> >On Mon, Feb 24, 2025 at 01:55:28PM -0800, H. Peter Anvin wrote:
> >> On 2/24/25 07:24, Uros Bizjak wrote:
> >> > 
> >> > 
> >> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:
> >> > > Refactor parity calculations to use the standard parity8() helper. This
> >> > > change eliminates redundant implementations and improves code
> >> > > efficiency.
> >> > 
> >> > The patch improves parity assembly code in bootflag.o from:
> >> > 
> >> >    58:    89 de                    mov    %ebx,%esi
> >> >    5a:    b9 08 00 00 00           mov    $0x8,%ecx
> >> >    5f:    31 d2                    xor    %edx,%edx
> >> >    61:    89 f0                    mov    %esi,%eax
> >> >    63:    89 d7                    mov    %edx,%edi
> >> >    65:    40 d0 ee                 shr    %sil
> >> >    68:    83 e0 01                 and    $0x1,%eax
> >> >    6b:    31 c2                    xor    %eax,%edx
> >> >    6d:    83 e9 01                 sub    $0x1,%ecx
> >> >    70:    75 ef                    jne    61 <sbf_init+0x51>
> >> >    72:    39 c7                    cmp    %eax,%edi
> >> >    74:    74 7f                    je     f5 <sbf_init+0xe5>
> >> >    76:
> >> > 
> >> > to:
> >> > 
> >> >    54:    89 d8                    mov    %ebx,%eax
> >> >    56:    ba 96 69 00 00           mov    $0x6996,%edx
> >> >    5b:    c0 e8 04                 shr    $0x4,%al
> >> >    5e:    31 d8                    xor    %ebx,%eax
> >> >    60:    83 e0 0f                 and    $0xf,%eax
> >> >    63:    0f a3 c2                 bt     %eax,%edx
> >> >    66:    73 64                    jae    cc <sbf_init+0xbc>
> >> >    68:
> >> > 
> >> > which is faster and smaller (-10 bytes) code.
> >> > 
> >> 
> >> Of course, on x86, parity8() and parity16() can be implemented very simply:
> >> 
> >> (Also, the parity functions really ought to return bool, and be flagged
> >> __attribute_const__.)
> >
> >There was a discussion regarding return type when parity8() was added.
> >The integer type was taken over bool with a sort of consideration that
> >bool should be returned as an answer to some question, like parity_odd().
> >
> >To me it's not a big deal. We can switch to boolean and describe in
> >comment what the 'true' means for the parity() function.
> 
> Bool is really the single-bit type, and gives the compiler more information. You could argue that the function really should be called parity_odd*() in general, but that's kind of excessive IMO.

Yes, I could, but I will not. :) I also feel like bool looks more
natural here.
