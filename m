Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551259;
	b=kXWcD9fad9fZIOKtWd7lRCcjxsp+710s9hrtBEcGZ645xhfzfB72Zh6xgJLqTl4JrLcc
	 dq+IDztOrMSr+UzLdOkZuRpCAt2zcOqfsV07Bj53RX1Ddwkp2UQzWpCyMHM6363pDhw7N
	 OWXEFQnVOqAN3RHAgkLQGby5xdwB/RzNR/mNYUsE9LHw0K0W68IPmB05sQV/9khopNRbR
	 Pu7H1VaSY6ShHU58KKlgx9VxCPeSEHkroi+VqRAPJidlJPhU5dSj3ejnfwhEdJJTJaLGE
	 MKqeOTRnjt8AWzuGLCuiJGa7eXOy8SyLKJZMDBpyrEJBEdGSAjWWlbgY9H7E5O278yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551259;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gwIwYMpes8uE9YDKwRwuExt98zMj3YPi1Pc/xc57m6w=;
	b=SfUFXs1OT+zuEO5x/zR/dtrXJRvAD4NVnspw85AyBAOQElbTRXtZptXHcDrLzzlmXTwd
	 FrFoBwoDXSJzXq8yQGugbBLrBUOdXE8UzPnW7gq7lZwvyAhz47Pnd1pOhgMOWLSI9jn14
	 1ZyqFPbeViPe6f767btyk+px/E5W1/fjEuOKQY3/vd/c4b7FZLR2wuNprbwkGbvzN0uIl
	 5eVV3b9pt+M1yhUpSQl9pkQ3u9MstF1Qi3VrxEVJDRa5oxrqPnYMCJkdRmj0ceAm6my8L
	 j9fPwAYJ/gNJ9+O9rueckmydxofdUhpKLxqkX4RTCGU8NBCcddJxPWnTJ/pVM2hting==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=R54C0G3g;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4872606A687
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4872606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=R54C0G3g
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso3473186a91.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551257; x=1796156057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gwIwYMpes8uE9YDKwRwuExt98zMj3YPi1Pc/xc57m6w=;
        b=05qw7RlGnOSS+q7l9lgTJaC6ufoMRFdDuE4WPaAbssX1o4keG4HPxflH2DxXxRJ5aG
         p/AYMgePbU+EU6ptoUW1B3NvtN/pokwd+N/YDHDTHGw1rvMq1U15aSzeCKFlw/rRiZK6
         lTPmWkTn0C6oRUCLBIL8eMPGxlkDdL4zUQ/d6CotHzJd6X4sM6YER6b/AwgiX7xmAP4B
         15Sz/hBkHhYcn7xzFvYuAIDXuO54r/8oWYlaNkjVoXZ73+LT3hevJF0hrCGVkPeMu5pu
         JG4kL7P9xP6KWmQHuuO2+iXgBqr1SqrI+gS4KZgfvfe157+6AURAYC7TVreNQ/moDs1s
         /dPA==
X-Forwarded-Encrypted: i=1; AL+hErGFa76UwHNMxPVHoUOk8Er+EiLAY1kJNhx26zUbOUo9ZXrHEftwLYIGLbkOxTQldv/fPsHhGNWYy9s=@lists.linux.dev
X-Gm-Message-State: APuU4Z/090aYiyCAdA+oZY4cTwsOvQmUSrOe6+7tJ1QoTVrYgxhvRU9N
	fFH7n3n0nGzyH8DK02sKLcX6CWMG3IP5RmfllDxyH7P/jlKjeL/Tq5bd318yp7mrx/eVfe9MBDR
	NH3BPPnvznaykbmJgfTZY1c9aMz4xQy9zp+bR5bdWNWVkJU1dG2XTZN7PxOt3rhSA2VPFU2Wq2j
	ZWtiskY8nOa+yagsDp3dE7DMVnKOMrocZZw6GAMwLf4ZIjtBckrLBdZ3V3v+gMowFwlgjs9BprX
	UoGFG7LS6xqnHWbH0c=
X-Gm-Gg: AZFdTZeBLqLWn5OaS+kxI8gmueuIq3BRFZElXNZR3GJTX6pfS75Ph4mB50hmlfni/UI
	OsJV83/081Ijk99ryGcz+Gm7+6g0svCKKuYuQO8LcxGLNkjDH10jXewdaBkEkihqpepIogY+Fue
	rJdPa+qDcMfRx9uCJ1/d87aZ0qWa8xH/mHhCnauzh3XgJ4RvAknnqhiRJuQwYuKxPuuhL5iBksh
	L2ibh0IvLuF+GrQKBgVcLfPR8jCitAhrHFcm8opjE6WO2GHinJ3QiacuOBmoktgIhGYdudDUSAk
	MBRQ27VM2Jj/jav2VaGXOTxtwqdFgtN64YWOyyfSGvt4CZ2vuuEfsNrcEpsMIQUE80tXMwrpchY
	v0q3d3ruA9SeNkl8zsvrFSYb4EcRDtIwAGEEZBQnvh2Fm5TLrE0ySeMjghP0O+NyVUekhr3d0vU
	OnS9xfDFjW8PyE27ws1sI0JZVkwEF4YbgtdR1etR6Kgw==
X-Received: by 2002:a17:90b:5287:b0:3b4:d22:8601 with SMTP id 98e67ed59e1d1-3b41c8fa9c8mr13743433a91.23.1795551256318;
        Tue, 24 Nov 2026 12:14:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfb370asm6005212a91.0.2026.11.24.12.14.15
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211604468aso76706676d6.3
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551255; x=1796156055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwIwYMpes8uE9YDKwRwuExt98zMj3YPi1Pc/xc57m6w=;
        b=R54C0G3gvYyhhsWIycQuTgEiAqabLz+n8zIK+PqvbmD2QB7UcVzAWPXse2UgfOWYV6
         p8aq2PEoqyA2c1hH8Q+nhONSv1Uqlykj7AjtRHwZ+6SOUeH9CZcCHO7NiVY0N2zBb6w8
         I6iVtBcQaerolPOt0VjiwVmXtC7aU3h/2lm60=
X-Forwarded-Encrypted: i=1; AL+hErFfE9kupKbip8lWtbnA3dLINJHv/G8xMohpIp/0E0dbWUXBAqYmXlNVLD3D0piTZ2XDyvtlU04tBWc=@lists.linux.dev
X-Received: by 2002:a05:6214:8624:b0:921:1b08:82a3 with SMTP id 6a1803df08f44-92134a7925amr276255406d6.18.1795551254621;
        Tue, 24 Nov 2026 12:14:14 -0800 (PST)
X-Received: by 2002:a05:6214:8624:b0:921:1b08:82a3 with SMTP id 6a1803df08f44-92134a7925amr276254806d6.18.1795551253988;
        Tue, 24 Nov 2026 12:14:13 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:13 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 7/7] wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info
Date: Tue, 24 Nov 2026 21:14:01 +0100
Message-ID: <20261124201402.3499613-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-8-rosenp@gmail.com>
References: <20261111042554.232998-8-rosenp@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:54 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> The driver only ever has one BSS configuration, and it has the same
> lifetime as struct brcms_c_info. Embed it directly instead of
> allocating it separately, removing one kzalloc()/kfree() pair and its
> OOM error path.
>
> Move the struct brcms_bss_cfg definition, unchanged, above struct
> brcms_c_info so that it is a complete type there.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/main.c        | 48 ++++++-------
>  .../broadcom/brcm80211/brcmsmac/main.h        | 68 +++++++++----------
>  2 files changed, 55 insertions(+), 61 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
