Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614DD199E92
	for <brcm80211@lists.linux.dev>; Thu,  5 Sep 2024 11:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725536406; cv=none; b=dIcBy8OhxidORe1SY5pp7r5s4Q8Wy26iIKSjkggtvumUMWBmgYN733KShEQORHdIwgA2M3XvuzA/vKTZfTioP+6gnmEGc8810ajDikWFndycKEtI0DZFIrF3zxQ5iwMloNYra+bGDfPcyTblvjPzSKZI6bNsPpHLSIauxaPApSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725536406; c=relaxed/simple;
	bh=zrVvUahKZA1Ly+gFFCpv1OrY4hxvtMfOO87dPXkzcrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1lBbc9dyAnrikYMrYe8cNpA7z7ICEeeII6xrMZml1IwiMJZRQvvXK3CAW4Qreeq4Rs2gOz1gpjY3eYqq5ErOefP0uge5mdjn2jG8QnwR7WlA4PPt4w8VpJu7KKTvUVmmKVvm2gkcSrABujkgancmzl9hoaxDCa1fr9sbXrJsxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0ZPwDzj; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0ZPwDzj"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5353d0b7463so1000866e87.3
        for <brcm80211@lists.linux.dev>; Thu, 05 Sep 2024 04:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725536402; x=1726141202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrVvUahKZA1Ly+gFFCpv1OrY4hxvtMfOO87dPXkzcrQ=;
        b=Z0ZPwDzjySiOTZX+DOVuC2Z+DQONehxvkDUtjUynC0iXHaD1cU14XqRMy9PpUBYm76
         SfSV3pYQKUMmqR/QObK57QMdn5Oc/hRBRd3YIgrMP9WH8GocY45fjc0QgnYjH8xmyaK2
         UadrqkQORfezuIKqwL+yUHCy+ulTknl3dy01o1G/jf9RjdQcsX6j0lTJlVnbQENL4CPk
         i39HiduLDb3I+4l27abrCUI3FawKyx+GYBVUsxu9nMO+WgWIMJPZ1YvGFSCFD/efUTnS
         hdhBiy8FP07rkzRpiAfs34MemY0UTdOMb5ZyT2AQ2A5NDo32+BP4EhQ8byN9YFrO+wzO
         ws3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725536402; x=1726141202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrVvUahKZA1Ly+gFFCpv1OrY4hxvtMfOO87dPXkzcrQ=;
        b=HVPLRJ8cmdWLsJF8nHuRypPxRM283+dMwrhdO3D6eqDofnPM9SEUiXLGTgre+8OJcE
         miD87aVCr/R6WRXjLiB0g+PumgO62oPTjUtwxoxKZEhlxqkOHtHBa3RLsff5DlO7G1FC
         zno6oYwUKoDj0NBNCiSdf8JQcPXxfKgwJOvy2yUY5CZw3mPd/iRkByxgRHg/DTqNp9la
         4/GSVlu4Ar+q9EDvg9Me1mS7R/alH1hTOmnRsFqHs7lTr8Jm64EO3UB4NQq/egtwPVdp
         2XTlAerk6g/KQZLOAjtrxbcwBX07EezpL8xdZxgtDw7ams+YYA//96GXI/lCQYaXxGwY
         LWlw==
X-Forwarded-Encrypted: i=1; AJvYcCUpjwvy69KfSpWR9pQpVGYZXNat8HDRTrZEO0v8faEvM6ufr1hE4XdCf6y5PCPIK1zpEoKZlfjbYkA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGHNqdmkaNDdX5VqgChgiOXlkrMPNxNsKWb37UScz/cgmDkMlf
	Po43Vyd03tLWuKlIQTLFgs6ysrVos62dbKKaWLf0WXsksHmvQSCglnJ/UeiUrr72YpCFbjQXw36
	K/zloJ4grIz35BM6CLv5uhFx5zCKW+zUw0TnkCA==
X-Google-Smtp-Source: AGHT+IEwZ/cUzkI93E/6LKm6cGyhHb8XA9AkNg8OpqoeSXVfyucD7/JsivArkGPITQJzkXL5zLtM+8AMY4ZU3v65zm0=
X-Received: by 2002:a05:6512:108b:b0:52c:df83:a740 with SMTP id
 2adb3069b0e04-53546b54df6mr16785064e87.30.1725536402123; Thu, 05 Sep 2024
 04:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240902225534.130383-1-vassilisamir@gmail.com> <20240902225534.130383-4-vassilisamir@gmail.com>
In-Reply-To: <20240902225534.130383-4-vassilisamir@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 13:39:50 +0200
Message-ID: <CACRpkdbjUe6aM0nHvEEEWaT1AG9kieiUuTx0M6G12Pnsvgcd6w@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] net: dsa: realtek: rtl8366rb: Make use of irq_get_trigger_type()
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	alsi@bang-olufsen.dk, andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	nico@fluxnic.net, arend.vanspriel@broadcom.com, kvalo@kernel.org, 
	robh@kernel.org, saravanak@google.com, andriy.shevchenko@linux.intel.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 12:55=E2=80=AFAM Vasileios Amoiridis
<vassilisamir@gmail.com> wrote:

> Convert irqd_get_trigger_type(irq_get_irq_data(irq)) cases to the more
> simple irq_get_trigger_type(irq).
>
> Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
