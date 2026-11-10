Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794330096;
	b=D5tPbIz3fORYFauSRC5ychwy2t2yaCNGq9+X+4bT6BtLtyAyWO5d+y3LC2VY0moAygEI
	 eKXZ80CYHlWKjGc55ZWpzgGsIRSURzUwPDkFBUWMbWUlvvfpL0rZfdc3nHs3ZHoUVUKRa
	 VcRsAPYfqjhsd8aGYjhSlPNaSm02VerQeKC5YSL0Twodhx8OEpMPx1AlZlumIapljBalj
	 XtcqNg2JqFVQskIAHG2KuM2EV1AlS4qmfnkrdH9zBTVFQCH6G5YWqpdbT8TdzSynMLPr1
	 DdUz86KiRhLnF4lpRf8rkAAk7Nnw9K/2jQzNiu52arZ4zEiMc2jJV7g01WnGS9otZLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PRiBbEmWvYRpDNvq5W8oT+0WClu7yq5mlhnTlEgSgUE=;
	b=IUHZm6tZYiWwBec30yCvEN2QHoltRcYsNcAknOZ8Q3Ck/8DXec21euFuMUPWYRTo4JGl
	 STsxL31R2gm0URPF+Mu3aAqDJDsyxBTGkwY2XBe1mW/tVhqmrtP1JMB1iU165WTftDsO+
	 +MC/y9SV0ZFvPdpEc5V0rl3Kg1mALhix4azojeNez4kAC/fmf5MBnnC2yAckFlef1VhaK
	 93KWN2dAZOa/CyY4x447x+frgcP+7zEocitSvX8Yf8LXJervoWt/GPj/R5/tbBVKavnHJ
	 BiBwGOlXWGkJkl/IA8CLkG8BE/ovCZ7j6jkC0NTCXYZyFn3hRx6JadSFuKtpVIZfX8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVpK8YJ8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D6606A31C
	for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 17:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CVpK8YJ8
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed0e2015aaso9752185ad.3
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 09:01:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794330095; cv=none;
        d=google.com; s=arc-20260327;
        b=hmYl22iWH9h3hq4eJE4+47/IL+9x6cPpURQoH66Vf/C8JYj+Nu0SWrvmSRuWxsPdlz
         3VlMLHSwU1Y4lHfgDWjqebRLTiMI5RPmdTFT82AkmwjJaHa5kYXEUpjh1LvjIE57TmO5
         ftf1yNCd1wM+PV52tg1NIdkT4nX+GgQw5KsTby/t7C0B14Qo6+9IR5OxEvs/MisD0kLC
         ADqe4SoIh2/2XMVysNdExDuIY04bIF/VS5Mqyrvc4WcCACDrd/EiVaBCyIwoDfZ0Qzys
         2C5hP5J/WqTzmROE0bYdagQrpRZEqxVkaIZJiHQDINz4gi7COfKqsIP/lr5kYeMMMx26
         HrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PRiBbEmWvYRpDNvq5W8oT+0WClu7yq5mlhnTlEgSgUE=;
        fh=+j476aEPfeexADeDoJ2RgZfyAz+bBNLkoJN9PAqNcLU=;
        b=bvSsaFkw0YTp5hEC8Sjy547DmFXxXgIv5iJdVOx6yjXHrThRu8v96QYdBJlfGgeS3w
         HKEyy0z+lqGG3VzJEgi0nHAqmET5QjHCpKRkENZsxoYVGzpvhxcKeY3E+W33SUGNm/S4
         m32UH3+GUMNd/qRjPq5rlCngTbfXirvY8tdFVk6R26olgvKF84gGPaE7eExZDpilFNcI
         //jXm9Y8vhlV0eAVEIFM/s3ZIMbcjguZRb2cVSVtKyTaW3z3jE4e7EA4vpuWLa9HnIsy
         R7ryU6NwsCA0Se5hrWF/bC0Qa5KL9y9+JvkFJZaGg/SCek150zg+Vmr+tXdlMwhFWAOe
         mNgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794330095; x=1794934895; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRiBbEmWvYRpDNvq5W8oT+0WClu7yq5mlhnTlEgSgUE=;
        b=CVpK8YJ8LHOdo0FxqfWGGPV+HB18NPYXMduZ/gluk2ENda/JbyTEMwj02Rvwuhbg7o
         ZHv5qNClDl7/WCVc25qpQZCKLMWdBVRsxwk2ecj14UGvGYV38pcb7EDP+RmVg9t/389h
         +v/j6JIgs5z6tLYfGnWG7jcvHgQc98ZcAYORlAaztAOv+j7hgu7zH770eB/z5iLW+HBV
         2y1Ww2Y1DXIsw9uSD73k8t5891D8GsgKJCa1N4qTg0nVTy3kV5gpcR/jaOn3ZKMUZJuQ
         B2fvFJfUSTMGx7dhFAk/mM+0us0lWSUeixuSBjpmpYCJPfJBsIPkyBIBmDnK/JwrLjpZ
         8+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330095; x=1794934895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRiBbEmWvYRpDNvq5W8oT+0WClu7yq5mlhnTlEgSgUE=;
        b=sLCg7rtS/er4Xh/NZ92QZGLcncZD5TPl2fMYyl+UhF1PHMHiE1TJyojyctTTBIg//H
         aFBjl4dFX7aQ2LgCbOFXV5qg4JG/YClj4tYy4GHAoez1TXQZBgSnVeeeaXTAVCM5Mffr
         1wa2svu85m5nQl9NcabsrjV6gYlcF1cBzaHKmPy2VWaXFwDFGsG1n49zC6l/xXnwYBca
         HNYkkFQmNXj13kznw9rlQbL1K1B97oPhXGDM9f8bgipGN8h3AMK1vN8i1LGbn9mb4kxR
         eFd36sbz1aTdBLZ63jb5fJ5MLVTFZcWeW78bcM48FXuFiwR1coPTn1vJag7VhuJ0hTID
         hOnQ==
X-Forwarded-Encrypted: i=1; AL+hErHwSCZuTZaGpd15saS8+UY40haAb+CxWd1lFvletVa1rXVL/wttIYUJrgxbsZTFWEOZYGvvAzY01XQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z+/fpy1Qp2RsSOfYVQP3hzpKzwVVN0iivnkFlq5hY2JYUcuJEPb
	bX9IfdQ2xo9i0n+VGGgqG8Z3td46n/ztB/806O32OmK9+fP4BUkK4mm8I41aW/TtVH7pFml+Zbk
	ndVqEPnzHUfG4WOui8o51TId9b7bJjTQ=
X-Gm-Gg: AYBFou1wy6rC7Pa37YiTEcQQ8o8YhjLCvvhY3bjM/V1u3nipWJ81i94cojn83iW08zf
	FtQqeAYjRoSyJIZvAgSsYR2RVHGq/7oO/orhzaU7r6AVIrmSY4MLpsMEQONImRwWTBP5PhjUYL5
	DPqbvdajq8y8OzOqtcVk6sUga8ZXLkc7QGMJVPVxUiQf+Dvfu8sPN1yfGku/zVgQ+PTfKlYGMQX
	2l3NWak9Mo1jTZAe4mUapTfObEZEjHwqYlvyYIGxFeIfyEzBXykEkzsqlGdJIMLiGLwL18ayeK7
	dOPtA8fNRiMvwqZDe+in6SgYaH369tyMeXoQabx5frjcHwQ8LmVTKXL3+ra6Rab30YMxVIk9PVc
	sU9rDl6Jzl0dE9I8gaGANA9ZK2jU5+xYTT281pX26qRrK8eAqGHmdjDxvKO5qDkiiXx15c4OmhN
	qHrNWnxj94IfsjyuZ7
X-Received: by 2002:a17:903:2c0d:b0:2dd:ad73:5b6c with SMTP id
 d9443c01a7336-2edb91d1be7mr29021395ad.28.1794330095334; Tue, 10 Nov 2026
 09:01:35 -0800 (PST)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026053633.361454-1-ragulbaby@gmail.com> <f79112b0-d4a3-49a7-aec7-190ad4951bb1@broadcom.com>
In-Reply-To: <f79112b0-d4a3-49a7-aec7-190ad4951bb1@broadcom.com>
From: Ragul Balaji <ragulbaby@gmail.com>
Date: Tue, 10 Nov 2026 11:01:22 -0600
X-Gm-Features: AclHuK-qAhQQJmLAEoUnYuJytpf9QaGHuJqgYrVYZ81qt_RC_QuekruQ3SpoK44
Message-ID: <CAJnRr=r=XMRcJEdM31DK+Z+bEJoz7gvLwS6XbHQSL+iN4+Krvw@mail.gmail.com>
Subject: Re: [RFC PATCH wireless-next 00/17] wifi: add a driver for Broadcom
 BCM4323x USB adapters
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	brcm80211@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 1:55=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 26/10/2026 06:36, Ragul Balaji wrote:
> > This series adds support for the following 802.11n USB adapters:
> > - Broadcom BCM43231 (Netgear WNA3100, Dynex DX-NUSB)
> > - BCM4323 (Netgear WNDA3100v2, Belkin F9L1101 and others)
> >
> >
> > The protocol was inferred from USB captures of the vendor's
> > Windows driver, cross referenced with code from brcmsmac, brcmfmac and =
b43.
> > The code which are copied almost as-is from the referenced drivers
> > are indicated in the comments of the code
> >
> > The driver supports:
> >
> > - station, P2P client and monitor interfaces
> > - HT20 and HT40, A-MPDU and A-MSDU transmission
> > - 2.4 GHz channels 1-14 and, on the BCM4323, 5 GHz channels 36-165
> > - hardware CCMP with management frame protection
> > - the LEDs and the WPS button
> >
> > Power save, AP, P2P GO, IBSS and mesh interfaces and hardware
> > TKIP/WEP can be added in later patches
> This is really old cruft and it is a different driver architecture.
> Within Broadcom we called it BMAC and when we upstreamed the brcm80211
> drivers this architecture was already going to be abandoned. The term
> BMAC is also found in brcmsmac code base so it is easy to see where the
> split was made for the RPC interface.
>
> Generally speaking I am a strong believer of reuse, but this series is
> touching the other drivers more than I like. I would rather split it in
> two series so we can apply the patches touching the existing drivers
> first and assure that there are no regressions. Then add the "new" BMAC
> driver.
Ok that makes sense. we will split it up into brcmfmac, brcmsmac and
the driver files.
Qn for you: should we rename this to "brcmbmac" or is this current name fin=
e?
>
> Regards,
> Arend
