Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2751A8C09
	for <brcm80211@lists.linux.dev>; Thu, 20 Jun 2024 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876804; cv=none; b=iAjfxMZX7B2rMSKrMai78IoLaXugX17b7l2hNiZrR8UG/Z/Wsu06FP27820EGYA0bSNylL80fC2pDr+ooJ1Rb/q+Jmmu1O073mGHzp2JOuIyjBh7YrMCqiADWuaVJyHi0C3wyJQDBx3NUlEzmCBo7Q0C0z48lNloenInnbdYcoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876804; c=relaxed/simple;
	bh=rNIOKzcwK3pdjqaqdsGkpgJmK9GSZc1BC+fo/O2YJXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRxRczJnR1Tku31mIO79wQHDSn31UJyiHShWZcYbwMBtaxgnfkVkfkP/qiXNb/1cAYRnztsKpoGPal3D/Fj76au2zRgvgevFMxxEkKvVXghJ6yld1DY4bYWG6U3xB9Pdd1K+lFMV+Gp7LS3AvmhsRDeItgysVmInKMrKzYE8TyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXfIgBEf; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXfIgBEf"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-63267c30eaaso6468317b3.1
        for <brcm80211@lists.linux.dev>; Thu, 20 Jun 2024 02:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718876802; x=1719481602; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgSLok9248zUH94CIqG1aU31X9pCD+9Gxn9TdonRlVc=;
        b=eXfIgBEfFhutPNmQ2YYIGZrCQTIk/pcvJ5c0QhnpWd5x3D+b9F6TbSw0pMdgqugUnJ
         E3BUuTswmeenCTxjciKt9OIw4hYSFkAkq0Myx/Il93iq5Mu4DgErBgDleYPEBn1Q2R1R
         vbIKU9ZKWKnm3XTzaXal83XlGRcFSZi/8mT7VskF2MMZbD7Pgz3FxxiweHGGp1R3jIvl
         oKlP2tFkNx8MeHJdj6QojPdYCcYrWU/NGjnC1ozUGaeGmQHE6nA48AtxPyIuEyniTtsN
         gC4QNAzdvX8YkJOMPOgG5p0WCHPTMcaMQn5B/6eE1bhbOnErCYC7SKEz895qce2MzMc0
         vr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876802; x=1719481602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgSLok9248zUH94CIqG1aU31X9pCD+9Gxn9TdonRlVc=;
        b=Cf532txiXJgHdacomsF6TI2EjycOvHpPVjnORkdZEypfUwxU9UQqlionIIe4ovUWae
         HmlkDwPAqRXqNVme8zkUdf4rouBnSGkdD874MZXH4dnqxwoN6NjdDnOJci+K2jguahwc
         Bb5pInluVuB4xLKjhR2HbfwsGg6EqXgfvvZcT80eYy8sVMgQT4DHmQD35m4r/ozaZc/W
         Q/y3HBio7M73gDDQ4hk9MtpeDQvhn4OzjhrJtzVXkwWcc1+YoeTbhP89H50izxOoNuWL
         vqmrttWNneq/Dqs6IzqPnyFmF0zhwe0IDDBxO7Gjt63YOCvZMqqsZXpx8fixQAfJz9dj
         5kKg==
X-Forwarded-Encrypted: i=1; AJvYcCXudvX42LSmpuB/ZnLoDhqBeuauFN+qBcNxQUfx5Lhv2Mcn18X0lP4lRxXQ2eP9mtfg6XRwva3uwZce8Yay8VY72U3nzK1nis1R
X-Gm-Message-State: AOJu0Yx0c/d7dUfhe+of66dY7jiAbSy/cI6ZpM9Su3/FyZnNTdFi2FX5
	5MvELiUMS7nmYY9haedJnHJVdRvTVuyky7TYaY9F2hL+kwLPUwX5QPrAeGmwkTTt/b/qRTCZb5Z
	rQIJbfs6mqc9xbWEFcaI6qpYLfR4=
X-Google-Smtp-Source: AGHT+IFqLSKS5K41fiVpUsu27BMJJni/5wt5ZZUTYsjR0JWKIVDOOYmzUA1liNLqeUTRNwAUzGgzfuvcIT0CMCcbPUc=
X-Received: by 2002:a0d:eb41:0:b0:61a:cd65:3010 with SMTP id
 00721157ae682-63a8e1dcaedmr48296707b3.30.1718876802073; Thu, 20 Jun 2024
 02:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617122609.349582-1-arend.vanspriel@broadcom.com> <CALeDE9O7DCPhoxdMyHmYFOjwdkPRepiaaC92QorzSTXCduZ+xQ@mail.gmail.com>
In-Reply-To: <CALeDE9O7DCPhoxdMyHmYFOjwdkPRepiaaC92QorzSTXCduZ+xQ@mail.gmail.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Thu, 20 Jun 2024 19:46:30 +1000
Message-ID: <CAGRGNgWH9U3XeatXA9xpkLz76COuL1xjYcfXQYLTGKBxvy=M-A@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmsmac: advertise MFP_CAPABLE to enable WPA3
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, Jun 20, 2024 at 7:19=E2=80=AFPM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> Hi Arend,
>
> > After being asked about support for WPA3 for BCM43224 chipset it
> > was found that all it takes is setting the MFP_CAPABLE flag and
> > mac80211 will take care of all that is needed [1].
>
> Testing this on a Raspberry Pi 4 [1] against a UniFi U6Pro AP I can't
> connect to my WPA3 only SSID, it works fine with the SSID that's
> WPA2/WPA3 on the same AP. It doesn't connect and I get a whole lot of
> the following errors while it tries:
>
> [  155.988865] brcmfmac: brcmf_set_channel: set chanspec 0xd02e fail, rea=
son -52
> [  156.100906] brcmfmac: brcmf_set_channel: set chanspec 0xd034 fail, rea=
son -52
> [  156.108597] brcmfmac: brcmf_set_channel: set chanspec 0xd038 fail, rea=
son -52
> [  156.116317] brcmfmac: brcmf_set_channel: set chanspec 0xd03c fail, rea=
son -52

The Raspberry Pis' WiFi chipsets use the brcmfmac driver and this is a
patch to the brcmsmac driver. This driver is for older and simpler
WiFi chipsets than the ones on the Raspberry Pis.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
