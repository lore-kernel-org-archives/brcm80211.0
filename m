Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE2D15575C
	for <brcm80211@lists.linux.dev>; Tue, 24 Sep 2024 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727182308; cv=none; b=OwO/wEsPg1ZOZ0vLCYGfrDD7Cz7MVXGhrE4yN2YVyY5YorTfH8fkqW9r2MHfvh58KZ6WojfnOegrkVQBhugMGWWVN55h8fPDWgOFcjPJkFwVlbZZ3M4+mYkuTntWczYxselqBI6RmlnLX+Xc0S+/5rOAjOXUFUUVZGLHAYjoIYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727182308; c=relaxed/simple;
	bh=NYnTT2mYdbSsYE8VZMZNZff4N+tsPnS3XfhKa7yfXm8=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=oaFJ+pq2Az34t/DUv4+WWn3qV4opyOxPTHJbRIJbynSogfCrNPglm34AHu1hq7DKEueCEhGzkNhbcjaeKH1RVf8pfIBTaeC+4mpDxMhzDjFiN8Gk2iL6wMsQihLvNb8qRwjRelkUQDwm/CeJXIKLX+RrD7nCT4s7Er+PsKRfoKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WZ0abAez; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WZ0abAez"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a99fde9f1dso488927185a.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Sep 2024 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1727182305; x=1727787105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEFroRaEUVVo0vhHoSJPYIHPSph3BJU5OJfsvq9T3TM=;
        b=WZ0abAezVFyjuNJFxtDAa473kFov3dFHLsKBbdiIVlTExFqrmICtCXG8zQiYaNbnNz
         Cb3Au099/pCeOoDr6zpSM/N6B85AxXOkKGKnoYSFLRXZ2v1r04T9JyigElZjNhUx2QPa
         FnAScIToSiio7MygEWlAujx/aScqyhyoaJfTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727182305; x=1727787105;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEFroRaEUVVo0vhHoSJPYIHPSph3BJU5OJfsvq9T3TM=;
        b=XiEnfncVxfqXZOWEs17ItHHDJLvAspn0VMEPM53DRI1ozZFF51CPJpuYeKWEIlAjJF
         o8gwbBbwDHa9MGuJ7o/qTn7Uyc1rGmmnv3Re6sTXcPvbWGwccloL1Zx/FFgdaArfofXO
         bNky16i5OIJ+Rz9/PM5ZCmP/xvQNiuE9CUrdnnAf6dKJuWFaXe/lnFS3riUHIPDrEnvy
         kdDOHXn36gNQsqp+ycRCrjXRDjXmIMcNIibgddwMe5voaRLiSPScaiwYBaxM4YZp50xv
         E5n9Z7gRNqWJiAofF6luYyJR+CpjIMYh0pXFqHyicxQ2SofkwserRgIARK8YaXsfiuRu
         Q+HA==
X-Forwarded-Encrypted: i=1; AJvYcCWvyfmiFWYqrVLZsZIe3NqxsSMqgYh6CKgusqppirg1LNoqGm4pPEmt+DM1jpPeKZLNFgWUQowC1MA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdIuz38f1VW95GNn7fl9NqV80kSXFFZsLwE/qba/HZ+t95won2
	2HHMbsM1VWm/o5iqeQ9zFjYXenTRoQJUg7/CeiVvDlzD6xSoZvUVIpt0OAIZwg==
X-Google-Smtp-Source: AGHT+IEnFVTCyWKq23rKwGg9QTjCsNUD+XWMRU6sHjLIqkYeDsd3w3aGVN81QJVBYLudmWpFjYvWSg==
X-Received: by 2002:a05:620a:4688:b0:79c:125a:9217 with SMTP id af79cd13be357-7acb80aac50mr2551056185a.18.1727182305268;
        Tue, 24 Sep 2024 05:51:45 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acde542f6dsm64933885a.49.2024.09.24.05.51.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2024 05:51:44 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Kalle Valo <kvalo@kernel.org>, "John W . Linville" <linville@tuxdriver.com>, Seth Forshee <sforshee@kernel.org>, "Pieter-Paul Giesberts" <pieterpg@broadcom.com>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-trace-kernel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 24 Sep 2024 14:51:38 +0200
Message-ID: <19224165b90.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <81a29b15eaacc1ac1fb421bdace9ac0c3385f40f.1727179742.git.geert@linux-m68k.org>
References: <81a29b15eaacc1ac1fb421bdace9ac0c3385f40f.1727179742.git.geert@linux-m68k.org>
User-Agent: AquaMail/1.52.0 (build: 105200518)
Subject: Re: [PATCH] brcm80211: BRCM_TRACING should depend on TRACING
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On September 24, 2024 2:09:35 PM Geert Uytterhoeven <geert@linux-m68k.org> 
wrote:

> When tracing is disabled, there is no point in asking the user about
> enabling Broadcom wireless device tracing.
>
> Fixes: f5c4f10852d42012 ("brcm80211: Allow trace support to be enabled 
> separately from debug")
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> drivers/net/wireless/broadcom/brcm80211/Kconfig | 1 +
> 1 file changed, 1 insertion(+)


