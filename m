Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238BA259CB2
	for <brcm80211@lists.linux.dev>; Tue, 10 Mar 2026 01:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105090; cv=pass; b=uHTR/kwkHyjAzlyBs19ickJoGkANVltW3y4Wikh4gYarPjhNGnqSsTUZpKJo0Q+6FgOOhdgIbFT2MJBGnMKLpPIroA40VQjW0a56hlYnm3UI+4ZnJ4jwQP+pbVcYiurmXTnd8zaYd9ypE1Q3nJwq22Mk6Paqt2BTnQLZkuoV3ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105090; c=relaxed/simple;
	bh=juCfXUUuExcjNHcu3zSf1JQAn4aCOtYK/2BxSHv7/HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onCHl0EAB0fhswMcFUpa4dwS+3gGpdNiMkx5Z/cdcDVUdGyupiB125AQUzWMh/QAUluu023Z7NU5eVODQ+hkTQQgJ7/O7mAO5IIZxcUc5BSlyfjliLeP1GIKpgsvytO9oRrGAF+lPzXo8AuZR1KYOjfCDqhoITDdbuT0yR8As1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bePy+GeK; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bePy+GeK"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899f27df3d1so88847456d6.3
        for <brcm80211@lists.linux.dev>; Mon, 09 Mar 2026 18:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773105088; cv=none;
        d=google.com; s=arc-20240605;
        b=GzZxrlhBB7cdTJ3bYKEahGycToomaUwZdo7umqnFd5Npz/tW1qU2Li61eaTlLjPBYN
         y7qSakV+IYTC32nfNk6wR5OW0KsZQUgQNLV9WoC4UndfI9krKV4B7UIDpA/LYLfWlGkq
         IJQnyqAhmApvDyM+4aKTyw82ENKdt2GvlnfyxePPlfWO4yTGf3wJakaOKRwNZRy1IaUM
         v7pF5kv6DYkoFsa6RkOAUPWu6/qLKC0LzrjCUuCFXRk7iasR1ygF/GN8y+GWFYuu8slm
         Zt3JX+uctXDpaRym9ECRafsbEl9qYuBm9TgNRRA6zUqQKKNV6JRM2fLhLX23psSXUIiS
         vxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=juCfXUUuExcjNHcu3zSf1JQAn4aCOtYK/2BxSHv7/HE=;
        fh=zh5SHKvyOEAOFd6vsUzB+byVQglnNmf+VeJJ0bi9zBk=;
        b=AaQYvb435en4srqtYAuD0Bd7ebHW/xBHAb7WNuK5tAdCbWmCT4Tk8X67cA3YwA2Ua5
         xNOeTjbVByu9Cy61829l7w5xKrwEGLv+1KJAzspTqFhv/1pc+Ow0S4dTYg/4DoklnOqb
         EGrMFR5ChNyjB4b2+M1J79isQG+Fevj4riC+qs9kb4oALUohRFIbOl2ueZUw7Dkj7ukA
         zG8H6AxhM0iEoPDsB2XfTXGJgrHlcwiuYMwhBrrWpdLksRFhhaqTlNnAU6gR+tXWJ/SK
         kgnSPMlwiX/jz3m+2Kh/dtGWxXrdDZ5egEuUko74t64ikOQe9hHFe7MbXfWEQcF20tqh
         NR/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773105088; x=1773709888; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juCfXUUuExcjNHcu3zSf1JQAn4aCOtYK/2BxSHv7/HE=;
        b=bePy+GeKB/dYyyEtP/IGDz1zLqVC6TqGDgb3lahJl0eVy1lNKjTdKyySHcJavI7tFv
         JdnQYVhhY1Opo++psruARt7r52+BqPbJQN1VrqqHaT7kDRSCRCVjxI4W2oKHeGFQZYfk
         gsNRpwgCQlC5wO4tIJQFnG8YPH6rwwPKLCjI3/NNdqMqZXEoENjagGnpRXuydtIXFJU+
         tIADDoIsro3dq0Tt87l3TYwVm7QbwX6Ex5sQEMwQU2/F5ZZ8sDAUcwHVKz9hLtokqHmy
         1XLsBHBCDykp0h0sYCkxYUuNO0qVSbrAEd5jtiElNaQLlR6M5V9R1bcfHzrcsm431eLU
         o64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105088; x=1773709888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=juCfXUUuExcjNHcu3zSf1JQAn4aCOtYK/2BxSHv7/HE=;
        b=vXyNSrOhrwmYfvksTSJVmP5vTEMElf3lG/GrKa/tNce0VWOAOlo9ipQdwXBQbyYvG1
         uCsoT/cFyG4aGVzmsbsAEj7FkB6xpSofxFklLJxwYIo3Y95xNelcUJrPYAjsnxm/A+0o
         eLgkKSzZZeDN0kjBfhkFFzDg7s1qT5Wtv5p53pU3wyogxeLjgbAyv3+ASj1Wd1n7aVEo
         GpIRPfQomSxZUFxE2WhLDShoz1ILxTGokrFxWqAUz7xB/NWelNlGgotyEDakYBSSonzv
         6WuM66kenaOM3XaZgiTjmQwmjZ4j+gAj6Avh/PO3mUfnpg+AvLnZwVyqeBToMW41d4dH
         gfag==
X-Forwarded-Encrypted: i=1; AJvYcCUfB+makWpj5srNH8PhWw/LQweYqkvnGi8zGRRr4DtE1HRx5Dk9YdG7IQNGplO2uP9z5jRGvDkV7m4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2ofcxabByQw/KLm6XZq/+GKl3VDGNycvfjDyJgUj26BH4AWDB
	tg3bCs1849A2TOcFwlthH+JPtEvQJoMooZpcizSaDfyV+yVz6+Tv5O02vuoMfTh0qCV4enZmreb
	aps6tdsW2v90+R5tPYDIUhtCVNyZOVKE=
X-Gm-Gg: ATEYQzyXcAQD5gyugtFoAUBjOoJeEAeQKbFOPM5dxPnW71DutJVVp3UgDD9ku75JT1E
	Gtjd3hyq1FAKeXSytP7z7YasDp7EdKbo79dQRm9EMyR95aT9MrDKYCt7j0U23UY3wo3BWRmRLWl
	Dc5wYwjsuBZvHaVGrNl2ULdOqS/bieRURr2djX/PYSGiSHXKI1QF910HRQ1IKg5MuoYVAD6j/se
	mw9+SrkYIoQjzfH4O57EsB77p/zS1+KlNFM2Cy+xTX2qHPxNagXd8epsDBZnzoRZdqXLH5KoMzo
	RiCfgBbGAwUZzFKrU6TXYQ==
X-Received: by 2002:ad4:5d6f:0:b0:89a:3bb:3c45 with SMTP id
 6a1803df08f44-89a30aa0cefmr198616826d6.33.1773105087965; Mon, 09 Mar 2026
 18:11:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309215907.5789-1-rosenp@gmail.com>
In-Reply-To: <20260309215907.5789-1-rosenp@gmail.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 10 Mar 2026 12:11:16 +1100
X-Gm-Features: AaiRm539ilhUNKbLBRR37080yIh2tOm94CHupgXvPMVDWErfsgjc9mqMF7mrcx4
Message-ID: <CAGRGNgUsVxecZobcXvVwmaHD+QHmzp4qTPGSLOpJb6Uinrpa+w@mail.gmail.com>
Subject: Re: [PATCHv2 wireless-next] wifi: brcmsmac: use FAM for debug code
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>, 
	"open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS" <brcm80211@lists.linux.dev>, 
	"open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS" <brcm80211-dev-list.pdl@broadcom.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arend,

On Tue, Mar 10, 2026 at 8:59=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Debug code requires a separate allocation to duplicate a string. A FAM
> allows properly sized allocation with a single kfree.

Sorry Rosen for hijacking your patch here.

With these changes, does allocating and copying the string really need
to be behind a DEBUG ifdef?

The allocation, copying and freeing of the memory isn't in a hot path,
so allocating/freeing a couple more bytes shouldn't matter that much,
which only leaves the memory footprint, which appears to be less than
10 bytes.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
