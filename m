Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE5945FFA7
	for <brcm80211@lists.linux.dev>; Tue, 15 Sep 2026 22:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511789; cv=none; b=hOy4PosTqUhHN5hZanz/e/Ji65dN4HqajVQftK2310ac2dMKGQgblfDGLR33WSrTWKXxbWCumm13VkmU/roy4tmKaHnECO7NLJ02W0A14KIxqTMf+rglJaqBUGPbWbuUIF/qx8atkjumDXC4ImIXGJrUZ8S1S1eBVi/F+PlNzHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511789; c=relaxed/simple;
	bh=NKKatqC2Re9eTa1xhiTQLVOdbcOfrB6iOyjGbHs3BmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIqpWY1T8lfW1D2nH2vkYJgR02DxDgsCPxWAg/fRHb533a3jBQ+KwAH1McIFoOCULKHGNDdu/8phgwicNeUNWvU0X9HRaZ1OhZxgBkuhmhQ42nS9LClR2WKd1YyLy++5uxmOoPvBfN4a4MWq6YFHwGL/kA/VzDVdeHMbGi6l/vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc88a9d1so193018fac.0
        for <brcm80211@lists.linux.dev>; Tue, 15 Sep 2026 15:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511785; x=1790116585;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQxcNZFJRBnNKYE5HTxR/5YC6FQVB68aqhBIuL0+JAU=;
        b=E2RDG4269bzbX53d3jg7KWSOyrNivvwMwQc6FZqEEUBVlhM731rcelcrDJqK5jqFl/
         G6w2pDIgvu5tl5PMzrzb6clE/q1Ip/k8KLR2pJZkp3qQF8XPaEvesw1ApzPCYfeQQhUf
         t0+sQvHFRQ8vnbfjJhXQ992SjSndUJF8mcuZWzGJ6wa9IGaPfyBlf27MFWkJfDpREPRj
         La0Xh2JCs8h+L3Z5iu+YHXxM76wx6HLqOt+0Ax4QVwHbgfPuEGbAemnz9bs2A8GS8oBP
         AQH0Cf0dJINCdzoitkyfZ09VZmj1m6BTqc33itrfSdvjbuN+e6Jofc9Sti6a96rp/QtS
         0zeg==
X-Forwarded-Encrypted: i=1; AKwUvBxzRjGsPzqd6Rt4TiGnOB4YTEzkXUlHm5oqQ514AZv2KczC11fvX8PvcrpD6NlGjXfdlMqshnbRT+0=@lists.linux.dev
X-Gm-Message-State: AFuF++nyYDtv9bnFld4r0auQQ+5z8dqWXdBetDHYz/8paFWV6kPgzXcY
	wX1yyLE9//BrLj8/ssbTbdO6JyO3CSM2G6EudapPdLOE0gM3TUNOwFYzmo40kg==
X-Gm-Gg: AYBFou24YDTgjlCoCrf6Assmo0gmjoBJr6Gy4W1p4Rg+6nWT+EyWoBAk99lFzhas3Yo
	K+Q4tY+O+734O9OuVMsxdNduUDfTECwNNZgo3qxH2oknM1i6JlOvUkqQIlxQBuOX/1bFA6eJgFB
	3rZMV7NgePztQXOKE8ly6+GROHdijS0ytUX+x+X6GMWzLcarePqoQRRpDnVAdsjDTj0zpCijvMI
	WFZJNjYwQeePVe2rjSU0KpOSZLq3r2E5TAHbiesBVPGNdxr+iL0WktXckpoEPo+NcOazOP4j/6z
	28iWnt/yjQwqIZ9hXDO4QtUMXU1LdJnfIhAEvpCJkChnbOM/ZGZ5P78scdVJwSngA9t13ejIcpm
	GvRt4RDcMPMUEc05Mx3RkyHsApQc3znxyn3HmyaJKaUphV4WEulimJlBmrtUjTHTTdoN+cOutni
	Ro/BMHtaMJvK1q2O53kTYJLvA2Y43GmmKfqCfnAC7WtgkAWD//NAw0zlRQ2KXXs2+Of62MENoMt
	EdESpJ+gIIT3TbGneXbl7UsywoHWCJlFfiZP7J7vPks4Q7GhPxZDzERTTCTk+haXn3+rcAExsn+
	/2DVtUO3Cd8RZZ41RDXkoNeUygJuV3jfIe2xmf3U4aiEdA8=
X-Received: by 2002:a05:6870:a412:b0:47f:2eec:be72 with SMTP id 586e51a60fabf-48478793506mr180627fac.39.1789511784986;
        Tue, 15 Sep 2026 15:36:24 -0700 (PDT)
Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com. [74.125.231.166])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm1356392fac.0.2026.09.15.15.36.24
        for <brcm80211@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:36:24 -0700 (PDT)
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-805cc8b4231so155780a34.2
        for <brcm80211@lists.linux.dev>; Tue, 15 Sep 2026 15:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByi7V8wrKHJ4O8rbC8cj4b3Sy3BnSrW2q/GmuetbNYSXNew5XI15Tk3CkjTeD1VDiIquJfgHdqaaiU=@lists.linux.dev
X-Received: by 2002:a05:6830:2b0a:b0:7e9:e709:44f6 with SMTP id
 46e09a7af769-80b2c5a740fmr490576a34.12.1789511784339; Tue, 15 Sep 2026
 15:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net>
In-Reply-To: <20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 15 Sep 2026 18:35:48 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_YwUiMGp824d_xSFu_tveO8fhg8iFkbF4yt+p3ZavgGA@mail.gmail.com>
X-Gm-Features: AcwNN1W2qt9nnEEFJwdUZ2bbqC9KmYt-CX0tJb1UVyZt85fT9jD1BRVwzLovmLE
Message-ID: <CAEg-Je_YwUiMGp824d_xSFu_tveO8fhg8iFkbF4yt+p3ZavgGA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: cfg80211: Report port_authorized for
 4-way HS offload
To: Janne Grunau <j@jannau.net>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, 
	Kalle Valo <kvalo@kernel.org>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, 
	Jason Huang <jason.huang2@infineon.com>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Arend van Spriel <arend@broadcom.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 3:17=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> Since commit 416386060 ("Mark authorization completed on driver
> indication during 4-way HS offload") [0] wpa_supplicant expects
> NL80211_CMD_PORT_AUTHORIZED to complete the authentication when the
> driver supports 4-way handshake offload.
> This was apparently never tested with the upstream brcmfmac driver as it
> does not report this. This broke authentication on Apple silicon devices
> (BRCM4378, BRMC4387, BRMC4388) and other devices when wpa_supplicant
> 2.11 was released [1]. This was initially dealt with by reverting the
> commit in Fedora [2] and other Linux distributions.
> Instead of carrying the revert over to wpa_supplicant 2.12 add the
> expected NL80211_CMD_PORT_AUTHORIZED when the connection is established.
>
> The "Fixes:" tag is not fully accurate as this has only became an issue
> after userspace changes years after the change. Since the change is
> expected to be required in all active stable branches for wpa_supplicant
> 2.11 / 2.12 compatibility it is helpful even though
> BRCMF_PROFILE_FWSUP_SAE did not exists then.
>
> Link: https://github.com/zephyrproject-rtos/hostap/commit/41638606054a098=
67fe3f9a2b5523aa4678cbfa5 [0]
> Link: https://lists.infradead.org/pipermail/hostap/2024-August/042893.htm=
l [1]
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2302577 [2]
> Link: https://lore.kernel.org/linux-wireless/20260911065656.1269623-5-Jas=
on.Huang2@infineon.com/ [3]
> Cc: stable@vger.kernel.org
> Fixes: b8a64f0e96c2 ("brcmfmac: support 4-way handshake offloading for WP=
A/WPA2-PSK")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - rebased on wireless-next with "brcmfmac: add FT/OKC roaming offload
>   support" applied
> - updated commit message
> - Link to v1: https://lore.kernel.org/r/20260912-brcmfmac-4way-handshake-=
offload-authenticated-event-v1-1-e41a6a8281a2@jannau.net
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/cfg80211.c  | 20 ++++++++++++++=
++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>

Looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
