Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795084683;
	b=Nvlfn1l/9YSXEfYXMOAHj/ANHTqzhDo/MMsGVMbtH7ij42Y6Gc1gmXtUDDUjxs+h6o1F
	 ceTz7hM8W/qsJB1CuKYr/UBllkmtqtYz6qZlNbObUsuh+UOSfWoOEQ8SUEOQiZr6l5tw9
	 kIika6cL/n7b+iwHorxQHqIoiNbKZ4nhZ5FrPE2ESbUYVYdoEdamAl5YAUsAb0r+X54Lk
	 sH98jseKA+iUQPUXer/dYgo9yakXuH1yg/rB1ER1souz2gNkSM87nE31A86+F2CQ1D1FS
	 mlXazZazofwQgqEs+oXEU/ciuq1rrnQN33DBGBuXXPYwLEF+WIB4DibMqsUajOiNkBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
	b=u/pAJQTUg/EYmhBJJNkIXbA+EXFhPj5d+PVR1aVoXVay6sKVAQe/3roCRRw3kcSQKwBc
	 /qyDBiJEzcaCpPsroKWSETtUayX6ETCD5r8qavMAlfSHG/wXJdSipH1FQPirYag0zQwGC
	 Y/WyuZt4PVehMS4e9dDeaz7499NYoXr0urWKsbMJ6yi4L8IKJuNqY//VIvw5uVz68nupK
	 5HCnyRBM/m63CsGavFxh311zKq1i4u3+gIzxj9wUr8uMjMi0tlPxvJVK1zM+OMZpeiUe1
	 e2TlSjcWOApFdHufi0K4tS/mTilxYRwXDy7W3dJ3ehOtqYr2eg6S7SViPjHQwVZ0iGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDx7HoRp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F3606A339
	for <brcm80211@lists.linux.dev>; Thu, 19 Nov 2026 10:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D8F3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDx7HoRp
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-716c0217635so866394eaf.0
        for <brcm80211@lists.linux.dev>; Thu, 19 Nov 2026 02:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795084682; cv=none;
        d=google.com; s=arc-20260327;
        b=MDPpfUB+u1tPK/Dv0TFo84c9267ffsfJ9e2mDAKI0Kmh/MHLc44gz7fHgij86s5Qr2
         3WakknucaljT6o0XU+P07qqVJdnlaJ8jBnA3JCsw99++CkZ6+Ldck82WSseWAFGzQp7f
         AxrmDLfvsWaS5F36cN79R/SVDM0QgG2L+L2cQAZJiSmPzqFtw6DDZ8movqHv7LZuVF2m
         Gu8or+OBB5C8oTx12hHCybILauOGJCSb6UiJffuG8cppkwPuXS2I4u0Pxxe4q4kYzw/w
         8Zd1NWjRoxUHZFlebyVQqoVGNEDqm07lzDcd/vIFxbN89eyLpd2jIyesTmmW+Gabh+39
         Umdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
        fh=q5XX0WJfqZuz4osV/5O39Eq6KECufGflU3jnGaYsUMo=;
        b=sFTon9tUlP7fOTeQva+ZB4OIRxa9V4DOx0yVgyJIJinCAnk5bsTf2lmSngQFxuMkQF
         gkXMtkXjUyhHfYgAxWmE0lkbX3Em7K1Jxqt4WOfrPOZoTLEWA5wFfwBJde2v1vIQZ1wX
         dx/TV2t8T5WZaH2FFkVPrWTWJ6oFu/ZbuMZCqBEOEiBdmm+11H/0h05NwXYwHvfzm5t5
         6DMOfD1bHM7SdpaLNVbBRrfm2Q1yOX9x0e/XDy1711kcLuOJ3wEXEv838j7oVfa6TcjB
         o6g20uA1yuCVdnDJV9e0cre0dCBSFc0esD6IYAcKDbmih07hYvRoZI7aRG5cODoDHt/g
         ZTEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084682; x=1795689482; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
        b=WDx7HoRpZHG982hzRdsdUiJ5r1vl27YfFwcR6fSCmu2MfszFznjIeHgwzX8dCzl2Tk
         tBKdhOzC6q2UFe5pAfnsh5hadZaVq1I7T1B9LJ1vDByvVfetbbCXUa/P2NgvfOHUIG14
         O6tLhb7d8fK8Dl/bF2kfyMsOMZ5/MvYrjxKp5TSf7qq1vBWIZwVna5X+ex3im9mqN8PH
         ywxWOc++0xgPYr0ZCoIOwyGGZX+X+Oy4sEIVJ50EAntfVeCYDoi62eoUG8cFQt46/4+d
         fFWFnK1UAKaFVbqtyXnrwtElqnC43ezHSpHNjk4cUw8xeFEhOldARBpZY+XtBAw506EY
         ryQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084682; x=1795689482;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
        b=K8WswHqVEwZu4aGYNSfh5e7IDEAU6vY+7I9ocsgRvuAMDQHLnASJQXPiNhRBacol3i
         eIWasmq5Tk6Sj8z/OFS2UZEKi6SdsAZkTNfBakx0rBesIiiNXxyMdBD32p4ah1KEsaas
         f4pOJf+IJEZ7qi5Tq2DXQIMjGoKOFqGpoLIfA+n39XNuREizlngzKsJB5px5io6Ir1fB
         Z0X+A/Lw4rE6ju4cCw0YtTPaGDttKFRvp+y9T5JeOXsDrtutN2SwEHxhN/LyfXebMqTH
         IQXMuyVzhq7qk2mMOnRNIdF2CaUmdrxAHAXnn09liJl2wEEp0T3ntEAsCbSRfKKj3lSI
         NSfg==
X-Forwarded-Encrypted: i=1; AL+hErGN3/C89+l9vLHnR2IM1J/MIywHtv9whle6d55VnlhD+qe+Mdt4ep5jXqvavIoOPxXgjuappfavO7U=@lists.linux.dev
X-Gm-Message-State: APuU4Z8fZlrUr2LXb+Z1Z+lJIvjB6p25XwDBpx5pit8yx9Tt2vN1ZTs+
	7szZkTcPBQ6Xd9rPunOts1oOtx+tEUa3ukDKAkcQYILps84WBKbstQ4jhkzHLaPvta/i/NQUNr/
	zJTD/TEt2DoxUo8TiF0Ljpq/q+FV2CCE=
X-Gm-Gg: AYBFou24sb1WzCnQfm10hza0AdVZPx4+Qc1v7y+8A+eGexkE08L7V/ADUGYzwntZKzl
	5IVPAu9hr6v/fmbQbRdjRX6Sbzfx1jlNl2+Ke9jupOYfaBA25G4XF2cYUAsgdyIadlzXYC/lQee
	0GZ8i+kFXcqwxJfYqV5zvnGOsJaljZL6O+W/ZwafBwsTfPUwiLQd49RfNnEWWr3M/PmiTYSd2rb
	lV4LUOGmQnuKxQinqikVSrCPJ7N0LqHbuaV4IRlPeRyZbkcWDegLuzvVoU+TCRHKRoHfb3qrXl7
	Rnl6cg6lfHB+OdOGIxz3w0X6oLx4z3f66frD1XB3IlxenhBg9yfP8wFvEk6+Wx3AowM/lcSTZHZ
	iRmJH13icvWFIuKnkncxA8lyNF3ZQwojEqTd6HKZc7/gy67nGnXO4k2wNzUXzX4yoxrGEfxphRy
	FwNttCt9GyZFGClJJvP7KsEa5EAOy/bg==
X-Received: by 2002:a05:6820:3503:10b0:6cd:3fdc:2664 with SMTP id
 006d021491bc7-71b3267b3d6mr204785eaf.37.1795084682370; Thu, 19 Nov 2026
 02:38:02 -0800 (PST)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112050816.2795512-1-ragulbaby@gmail.com> <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
In-Reply-To: <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Thu, 19 Nov 2026 02:37:23 -0800
X-Gm-Features: AclHuK9pB0av0B2Ec4fhz9yUKq6D5l_BFPjgXFCn4ODJXfmSjZymkoZ_qi1RZTA
Message-ID: <CABOQOSVNZ0M7u80pCMOSTFH8vW2eAYQmcJKowdtTubj0-bLagA@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a
 shared header
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Ragul Balaji <ragulbaby@gmail.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 04:52, Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On Thu, 12 Nov 2026 13:08:15 +0800, Ragul Balaji wrote:
> > The Broadcom USB bootloader downloads firmware the same way for other
> > USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
> > firmware header and response layouts from brcmfmac's usb.c to a header
> > in the shared include directory, so that other drivers can use them.
> >
> > Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  .../net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 68 +---------------
> >  .../broadcom/brcm80211/include/brcm_usb_rdl.h      | 78 ++++++++++++++++++++++
> >  2 files changed, 79 insertions(+), 67 deletions(-)
>
> [...]
>
> > +#ifndef      _BRCM_USB_RDL_H_
> > +#define      _BRCM_USB_RDL_H_
> > +
> > +#include <linux/types.h>
> > +
> > +#define BRCMF_POSTBOOT_ID            0xA123  /* ID to detect if dongle
> > +                                                has boot up */
> > +
> > +#define TRX_MAGIC            0x30524448      /* "HDR0" */
>
> [...]
>
> The move itself looks fine. Like the series "Move brcmsmac code into
> brcmutil in preparation for brcmbmac" (posted a few minutes later), it is
> part of the reorganization that has to go in before the brcmbmac driver
> is sent again, and nothing else in the tree uses this header yet. Keeping
> the brcmfmac and the brcmsmac parts as separate patches is fine, but
> please send them as one series with a common cover letter, so the shared
> pieces are reviewed together. Since the series then touches more than
> brcmsmac, rename it to something like "Reorganize brcm80211 code into
> shared directories in preparation for brcmbmac". Can you clarify the
> additional sign-off from Ho Jie Feng? Did he co-author the patch or did
> you use his (earlier) work?
Yes, the driver was co-developed with me over a few months.

> Regards,
> Arend
