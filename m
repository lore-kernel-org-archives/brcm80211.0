Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473138B7DB
	for <brcm80211@lists.linux.dev>; Sun,  6 Sep 2026 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788691458; cv=none; b=mRFmpRG5OD4FFj7Ro+ab/UOa/xyPpzlWTm9jf4Gbq+W7Fkjs+KpzpjYNPN+KvB1siUWA2ZX3MhRXtz5L/cFOn0cWUuF/C+FNm25wQqlBJo0tz6OXgeDzRycdWXq/IKH7ahe+mE5DuRk55kvUidzkDMp8zNjYbgpCHqmrG2gpchc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788691458; c=relaxed/simple;
	bh=Zxbr/MyJJe9YJZaEM1Cq3zqovEChybWZAlK04d4Du2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jy6j5rvKdU6mHJsg9Jplz+zsa75T5+Thy0rFbG9QcIP9ARRk3NfnAvm7nE4YuGpQgJuQEBOjrhCWVkL6KQv3NHtYf4qa1agUfF7nd0ZA58FPLUEOVB4h2Ki4FINfvfKo6CvlAyym6jQqgu0dV/xN3sOVvf6ANtMzQhYAVQTJhf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raRDRUIw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raRDRUIw"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484392e3d33so1637955f8f.2
        for <brcm80211@lists.linux.dev>; Sun, 06 Sep 2026 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788691454; x=1789296254; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0/+wqBmIy7IfhisO1aQJ97wf2sAIX1/xLpRpUIc4gE=;
        b=raRDRUIw6XdswytemyuSUSXlmA6tqOPOSSDEaNUtRvglE1KgepsrUcVg16cZWjs8wb
         gDMfcHuH2YjezMm1gLKR99J4w1OoOAplP6FGzlMvgOzSg1UVAlg8hnDs7HpejW3FvZv5
         zbUyt1s4NvNrKjoc1bXjebVZEwTY0ntANFFoW6h8q8b6fuVAcIfRKJt8pdQLPGYeVDAq
         A2YkrFlqs9+WG0LzagmAGB5AHlFeAHBgVb14n8XV1XSn0HZsal0+dwE0+kfevlxtFHz+
         W6W/Wqa5tNvTt7odF9MIZeju4i2kw62z303Nd+f9DFqa+5VJ1Zuoa735HglFlxqDfRC7
         Vs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788691454; x=1789296254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0/+wqBmIy7IfhisO1aQJ97wf2sAIX1/xLpRpUIc4gE=;
        b=qPkK9leqkzvntptdb2+DaIr6bMPS/JC2T62Yaq5Eoj7BxaplAQy+Tp+uzScoMJZUQZ
         jBn3HGRAS3asEQEJX+/D0qun51jkMeu71IO4tsIG6LQ26vIJPdCfe9hBJtzhXRYJteLS
         IU93PBk4Y7rKgr56x01zZsyB7sJS/UYMldxGgHpjcMRrOGS0rgRfkib3TDM/hczcGRgF
         Oo8E43OV0XHFpPVhSWMI7aUmgOjLa/VZFsFJMdifER8zaan+Stjd5BVvTnSt18S/kgXW
         nbakMG0uBygx9xz9OXbdHON/n/cvDSKlq1sLgcdA4FNyzv1TCEVj7fuV4oWcWE2rhbh3
         /Pqg==
X-Forwarded-Encrypted: i=1; AKwUvBwXEOX37b8s3I9k8fgDUmasP1uaJTVhXLYnX88Id4FBgNpKRYSCASrq5De01hg9Xa7z153mLxUGbaU=@lists.linux.dev
X-Gm-Message-State: AFuF++nT1C+cBALGBwJZONseX/gtuITK5emTHy+y8SoaOoWaQKG1g9N3
	4ievJdj9l1gpizi54bYuA4Cz74x3TQQhEvZGTOC032zLylQ5vMx9y/gP
X-Gm-Gg: AYBFou2d2GT308tgXrdpy5patIY7aNFZhQw++0MH/BZPbRwxXTqb7jCT2TrmN3VavuX
	3ERBKNbZLhTKhqzlqAew4svqazlKqD8x0FbtSSWXCVZFRrcG3GkRHxW9pphBuzd0mc/2zZSQytc
	wcj40fFDzZcM2FR8uw7GZPbN0fzT51bzYDydmTx2j7XlIWPgMu9UpAyMVliGL0L3nTuwndELRSi
	n1dgN+IXkSH205ZRdX50c3JjW1NkiR++JFZvTDnzcamTVXjGFuz6AhxOju7eMjE+0EGSiZqdGeg
	O1QtLlJawzdD6uAUql9ba6y/Dq7Ri2wUr3efNatA1DSCkGVUrjib8McNYXg90DHmMTCpZqoE1Rw
	YSiyUgwDseXI5/FpCK9iw1CcSbIbOnao9R+MrwfwUFv6G2J3s8xH5lp6WYAReO99pwdjIn5CsTx
	gPSZgWCbHfCaPF9tyfZEP6LRq+Ix/tNKSn3/RxkrJFlgvy3RPG38f4q2RSWf2Vcixx47sw2lq9X
	zxlA1W5dzTu1pxQlQRsTcHWV/6hCBVNp5wS5cmya5Gl07jJOBiWayK7mND8/vkOZEM=
X-Received: by 2002:a05:6000:2c0a:b0:482:d94e:f33b with SMTP id ffacd0b85a97d-48586e2ea8cmr18284958f8f.0.1788691454427;
        Sun, 06 Sep 2026 03:44:14 -0700 (PDT)
Received: from shift.daheim (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm21162225f8f.21.2026.09.06.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 03:44:13 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.100)
	(envelope-from <chunkeey@gmail.com>)
	id 1x3AM8-000000007UR-3W69;
	Sun, 06 Sep 2026 12:44:12 +0200
Message-ID: <d739eb56-b37d-4056-abf2-c3a4c9ba8662@gmail.com>
Date: Sun, 6 Sep 2026 12:44:12 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Jeff Johnson <jjohnson@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Stanislaw Gruszka <stf_xl@wp.pl>, Michael Buesch <m@bues.ch>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 b43-dev@lists.infradead.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, libertas-dev@lists.infradead.org
References: <20260904124353.6183-1-hemanth.selam@gmail.com>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20260904124353.6183-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 2:43 PM, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Sure, for the p54 and carl9170 parts:

Acked-by: Christian Lamparter <chunkeey@gmail.com>

Does anyone know what ever happened to the trivial-patches?
https://www.kernel.org/pub/linux/kernel/people//rusty/trivial/template-index.html
Is this still going?

> ---
>   drivers/net/wireless/ath/carl9170/fwcmd.h                 | 2 +-
>   drivers/net/wireless/ath/carl9170/main.c                  | 8 ++++----
>   drivers/net/wireless/broadcom/b43/b43.h                   | 8 ++++----
>   drivers/net/wireless/intersil/p54/p54pci.c                | 2 +-
> 
> diff --git a/drivers/net/wireless/ath/carl9170/fwcmd.h b/drivers/net/wireless/ath/carl9170/fwcmd.h
> index e5bcc364f088..40554e4bd149 100644
> --- a/drivers/net/wireless/ath/carl9170/fwcmd.h
> +++ b/drivers/net/wireless/ath/carl9170/fwcmd.h
> @@ -69,7 +69,7 @@ enum carl9170_cmd_oids {
>   	CARL9170_CMD_FREQ_START		= 0x23,
>   	CARL9170_CMD_PSM		= 0x24,
>   
> -	/* Asychronous command flag */
> +	/* Asynchronous command flag */
>   	CARL9170_CMD_ASYNC_FLAG		= 0x40,
>   	CARL9170_CMD_WREG_ASYNC		= (CARL9170_CMD_WREG |
>   					   CARL9170_CMD_ASYNC_FLAG),
> diff --git a/drivers/net/wireless/ath/carl9170/main.c b/drivers/net/wireless/ath/carl9170/main.c
> index 61c7a1288743..21d8798dedb5 100644
> --- a/drivers/net/wireless/ath/carl9170/main.c
> +++ b/drivers/net/wireless/ath/carl9170/main.c
> @@ -575,7 +575,7 @@ static int carl9170_init_interface(struct ar9170 *ar,
>   	 * NOTE: If the previous main interface has already
>   	 * disabled hw crypto offload, we have to keep this
>   	 * previous disable_offload setting as it was.
> -	 * Altough ideally, we should notify mac80211 and tell
> +	 * Although ideally, we should notify mac80211 and tell
>   	 * it to forget about any HW crypto offload for now.
>   	 */
>   	ar->disable_offload |= ((vif->type != NL80211_IFTYPE_STATION) &&
> @@ -677,12 +677,12 @@ static int carl9170_op_add_interface(struct ieee80211_hw *hw,
>   	if (old_main) {
>   		/* We end up in here, if the main interface is being replaced.
>   		 * Put the new main interface at the HEAD of the list and the
> -		 * previous inteface will automatically become second in line.
> +		 * previous interface will automatically become second in line.
>   		 */
>   		list_add_rcu(&vif_priv->list, &ar->vif_list);
>   	} else {
> -		/* Add new inteface. If the list is empty, it will become the
> -		 * main inteface, otherwise it will be slave.
> +		/* Add new interface. If the list is empty, it will become the
> +		 * main interface, otherwise it will be slave.
>   		 */
>   		list_add_tail_rcu(&vif_priv->list, &ar->vif_list);
>   	}
> diff --git a/drivers/net/wireless/intersil/p54/p54pci.c b/drivers/net/wireless/intersil/p54/p54pci.c
> index 6588f5477762..68e929fa213c 100644
> --- a/drivers/net/wireless/intersil/p54/p54pci.c
> +++ b/drivers/net/wireless/intersil/p54/p54pci.c
> @@ -534,7 +534,7 @@ static void p54p_firmware_step2(const struct firmware *fw,
>   		/*
>   		 * This will indirectly result in a call to p54p_remove.
>   		 * Hence, we don't need to bother with freeing any
> -		 * allocated ressources at all.
> +		 * allocated resources at all.
>   		 */
>   		device_release_driver(&pdev->dev);
>   
