Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016D71AD3FC
	for <brcm80211@lists.linux.dev>; Mon,  9 Sep 2024 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725874762; cv=none; b=hVDuoRqCrxUMEQ0d60/gRGVfVp7ylA32Bl3kztT5EhjPsm4SQhAbUz4Kr5NpisdK27hpFI2De3BgJsn+cLd6RSu2Sx1z7evZ0HcOoXLERO1o4Jqz0rthAPpwWeTmtZhHXZA86s9OXJJ7YkSoUhd3GVQ1ce3jKkU2zEJH/dZpHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725874762; c=relaxed/simple;
	bh=lBf/CNQ88ALyzNV0GvFdAbVq64+WOreVBfo10rTF9yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WMAgCrxmE2o+M8WJ8XmJ7ewtUMqikJynOBEmskWeqWu6uU+U6evTHxPOVcKcUm5KFaty2yWSSvOlyl8CBl4WnDQdrdy5Z5AZ+3fzfk8u6HevzzmFtEtycafBKuwCu8xo5qmQrzP38q6HOJ4wPgCacciOU59kVUvL/QKPZRKU0OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ENx3/TxX; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ENx3/TxX"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4899d4vt094424;
	Mon, 9 Sep 2024 04:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725874744;
	bh=2WKxLYR2ujHMEycARUDpMqJCzOD5eM5Uqny1jowdwfc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ENx3/TxXbpvjL/1NAd3/K+7EdnPRX2BeMuWxjvo9v3S2OREThfIgE6ZuEDPyz40rM
	 hTRr1z6wKpJ2C/iB2awzkq1yx/qKGUk6wGt2TlAVlgdIZIc4j7y3f/KCYlV8Aq/3TF
	 bdKQ+4SBvQOvUOUe8WKvkIKm9AOXwrMnwFohYFis=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4899d4oT061987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Sep 2024 04:39:04 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Sep 2024 04:39:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Sep 2024 04:39:04 -0500
Received: from [10.250.149.85] ([10.250.149.85])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4899cxi2035247;
	Mon, 9 Sep 2024 04:39:00 -0500
Message-ID: <c2886640-e342-4b2f-8c24-02c6edd901eb@ti.com>
Date: Mon, 9 Sep 2024 13:38:58 +0400
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2 3/3] wifi: wlcore: sdio: Use helper to
 define resources
To: Vasileios Amoiridis <vassilisamir@gmail.com>,
        <arend.vanspriel@broadcom.com>, <kvalo@kernel.org>
CC: <knaerzche@gmail.com>, <leitao@debian.org>, <linus.walleij@linaro.org>,
        <javierm@redhat.com>, <linux-wireless@vger.kernel.org>,
        <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>,
        <linux-kernel@vger.kernel.org>, <sabeeh-khan@ti.com>
References: <20240904154919.118513-1-vassilisamir@gmail.com>
 <20240904154919.118513-4-vassilisamir@gmail.com>
Content-Language: en-US
From: "Khan, Sabeeh" <sabeeh-khan@ti.com>
In-Reply-To: <20240904154919.118513-4-vassilisamir@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Vasileios,

On 9/4/2024 7:49 PM, Vasileios Amoiridis wrote:
> Resources definition can become simpler and more organised by
> using the dedicated helpers.
>
> Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
> ---
>  drivers/net/wireless/ti/wlcore/sdio.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/wireless/ti/wlcore/sdio.c b/drivers/net/wireless/ti/wlcore/sdio.c
> index 9e1b644beba9..a73207bbe5d7 100644
> --- a/drivers/net/wireless/ti/wlcore/sdio.c
> +++ b/drivers/net/wireless/ti/wlcore/sdio.c
> @@ -323,15 +323,12 @@ static int wl1271_probe(struct sdio_func *func,
>  
>  	memset(res, 0x00, sizeof(res));
>  
> -	res[0].start = irq;
> -	res[0].flags = IORESOURCE_IRQ | irq_get_trigger_type(irq);
> -	res[0].name = "irq";
> -
> +	res[0] = DEFINE_RES_IRQ_NAMED(irq, "irq");
> +	res[0].flags |= irq_get_trigger_type(irq);
>  
>  	if (wakeirq > 0) {
> -		res[1].start = wakeirq;
> -		res[1].flags = IORESOURCE_IRQ | irq_get_trigger_type(wakeirq);
> -		res[1].name = "wakeirq";
> +		res[1] = DEFINE_RES_IRQ_NAMED(wakeirq, "wakeirq");
> +		res[1].flags |= irq_get_trigger_type(wakeirq);
>  		num_irqs = 2;
>  	} else {
>  		num_irqs = 1;

Tested-by: Sabeeh Khan <sabeeh-khan@ti.com>
Reviewed-by: Sabeeh Khan <sabeeh-khan@ti.com>

